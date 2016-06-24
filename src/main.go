package main  // import "./"

import (
	"net/http"
	"github.com/go-martini/martini"
	"os/exec"
	"fmt"
)

func main() {
	m := martini.Classic()
	m.NotFound(func(res http.ResponseWriter, req *http.Request) (string) {
		cmd := exec.Command("curl", "-X" + req.Method, "--unix-socket", "/var/run/docker.sock", "http:" + req.RequestURI)
		out, err := cmd.Output()
		if err != nil {
			fmt.Print(err.Error())
		}
		return string(out)
	})
	m.Run()
}