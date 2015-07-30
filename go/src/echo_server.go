// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// NOTE(nlacasse): This file was taken from $MOJO_DIR/src/examples/go.  The
// only changes are the mojom import path.

package main

import (
	"log"

	"golang.org/x/mobile/app"

	"mojo/public/go/application"
	"mojo/public/go/bindings"
	"mojo/public/go/system"

	"mojom/echo"
)

//#include "mojo/public/c/system/types.h"
import "C"

type EchoImpl struct{}

func (echo *EchoImpl) EchoString(inValue *string) (outValue *string, err error) {
	log.Printf("server: %s\n", *inValue)
	return inValue, nil
}

type EchoServerDelegate struct {
	stubs []*bindings.Stub
}

func (delegate *EchoServerDelegate) Initialize(context application.Context) {}

func (delegate *EchoServerDelegate) Create(request echo.Echo_Request) {
	stub := echo.NewEchoStub(request, &EchoImpl{}, bindings.GetAsyncWaiter())
	delegate.stubs = append(delegate.stubs, stub)
	go func() {
		for {
			if err := stub.ServeRequest(); err != nil {
				connectionError, ok := err.(*bindings.ConnectionError)
				if !ok || !connectionError.Closed() {
					log.Println(err)
				}
				break
			}
		}
	}()
}

func (delegate *EchoServerDelegate) AcceptConnection(connection *application.Connection) {
	connection.ProvideServices(&echo.Echo_ServiceFactory{delegate})
}

func (delegate *EchoServerDelegate) Quit() {
	for _, stub := range delegate.stubs {
		stub.Close()
	}
}

//export MojoMain
func MojoMain(handle C.MojoHandle) C.MojoResult {
	application.Run(&EchoServerDelegate{}, system.MojoHandle(handle))
	return C.MOJO_RESULT_OK
}

func main() {
	app.Run(app.Callbacks{})
}
