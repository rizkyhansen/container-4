package main

import (
  "net/http"

  "github.com/gin-gonic/gin"
)

func main() {
  r := gin.Default()
  r.GET("/", func(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{
      		"code" : 200,
			"language" : "go version go1.24.2",
			"message" : "Server running on port 8000",
      "description" : "aplikasi ini sudah berjalan dan terima kasih"
    })
  })
  r.Run("0.0.0.0:8000") // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}