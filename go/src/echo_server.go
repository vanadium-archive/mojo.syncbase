// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// NOTE(nlacasse): This file was taken from $MOJO_DIR/src/examples/go.  The
// only changes are the mojom import path.

package main

import (
	"log"

	"mojo/public/go/application"
	"mojo/public/go/bindings"
	"mojo/public/go/system"

	"mojom/echo"
)

//#include "mojo/public/c/system/types.h"
import "C"

type echoImpl struct {
}

func (e *echoImpl) EchoString(in *string) (out *string, err error) {
	log.Printf("server: %s\n", *in)
	return in, nil
}

type delegate struct {
	stubs []*bindings.Stub
}

func (d *delegate) Initialize(ctx application.Context) {}

func (d *delegate) Create(req echo.Echo_Request) {
	stub := echo.NewEchoStub(req, &echoImpl{}, bindings.GetAsyncWaiter())
	d.stubs = append(d.stubs, stub)
	go func() {
		for {
			if err := stub.ServeRequest(); err != nil {
				connErr, ok := err.(*bindings.ConnectionError)
				if !ok || !connErr.Closed() {
					log.Println(err)
				}
				break
			}
		}
	}()
}

func (d *delegate) AcceptConnection(conn *application.Connection) {
	conn.ProvideServices(&echo.Echo_ServiceFactory{d})
}

func (d *delegate) Quit() {
	for _, stub := range d.stubs {
		stub.Close()
	}
}

//export MojoMain
func MojoMain(handle C.MojoHandle) C.MojoResult {
	application.Run(&delegate{}, system.MojoHandle(handle))
	return C.MOJO_RESULT_OK
}

func main() {}
