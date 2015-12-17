package main

import (
	"./controllers"
	"github.com/gin-gonic/gin"
)

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()

	// Routes
	r.GET("/api/v1/ping", statusController.Ping)

	r.Run(":8888") // listen and serve on 0.0.0.0:8888
}
