// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// NOTE(nlacasse): This file was taken from $MOJO_DIR/src/examples/go.  The
// only changes are the mojom import path, and the location of
// echo_server.mojo.

package main

import (
	"fmt"
	"log"
	"os"

	"golang.org/x/mobile/app"

	"mojo/public/go/application"
	"mojo/public/go/bindings"
	"mojo/public/go/system"

	"mojom/echo"
)

//#include "mojo/public/c/system/types.h"
import "C"

type EchoClientDelegate struct{}

func (delegate *EchoClientDelegate) Initialize(ctx application.Context) {
	// TODO(nlacasse): Using a file:// url for the mojo service will not work
	// on Android.  We should be using --map-origin flag, but that is not
	// supported on Linux.  See https://github.com/domokit/mojo/issues/349
	wd, err := os.Getwd()
	if err != nil {
		panic(err)
	}
	serverName := "file://" + wd + "/gen/mojo/echo_server.mojo"

	echoRequest, echoPointer := echo.CreateMessagePipeForEcho()
	ctx.ConnectToApplication(serverName).ConnectToService(&echoRequest)
	echoProxy := echo.NewEchoProxy(echoPointer, bindings.GetAsyncWaiter())
	response, err := echoProxy.EchoString(bindings.StringPointer("Hello, Gopher world!"))
	if response != nil {
		fmt.Printf("client: %s\n", *response)
	} else {
		log.Println(err)
	}
	echoProxy.Close_Proxy()
	ctx.Close()
}

func (delegate *EchoClientDelegate) AcceptConnection(connection *application.Connection) {
	connection.Close()
}

func (delegate *EchoClientDelegate) Quit() {
}

//export MojoMain
func MojoMain(handle C.MojoHandle) C.MojoResult {
	application.Run(&EchoClientDelegate{}, system.MojoHandle(handle))
	return C.MOJO_RESULT_OK
}

func main() {
	app.Run(app.Callbacks{})
}
