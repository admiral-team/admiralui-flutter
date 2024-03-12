package demo

import (
	"io/ioutil"
	"log"
	"strings"
)

func ChangeRemoteDemoBranch(branchName string) {
	const pubspecYaml = "../../../remote_demo/pubspec.yaml"
	input, err := ioutil.ReadFile(pubspecYaml)
	if err != nil {
		log.Fatalln(err)
	}

	replacedString := strings.Replace(string(input), "ref: main", "ref: "+branchName, 1)
	err = ioutil.WriteFile(pubspecYaml, []byte(replacedString), 0644)
	if err != nil {
		log.Fatalln(err)
	}
}
