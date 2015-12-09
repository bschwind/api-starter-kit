package main

import "github.com/gin-gonic/gin"

func main() {
	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()
	r.GET("/api/v1/ping", func(c *gin.Context) {
		c.String(200, "pong")
	})
	r.Run(":8888") // listen and serve on 0.0.0.0:8888
}
