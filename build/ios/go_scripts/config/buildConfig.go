package config

import (
	"io/ioutil"
	"log"
)

func BuildIosConfigFiles(googleApiKey string) {
	const googleServicesConfig = "../../../example/ios/GoogleServicesConfig.xcconfig"
	_, err := ioutil.ReadFile(googleServicesConfig)
	if err != nil {
		log.Fatalln(err)
	}

	token := "GOOGLE_API_KEY="+googleApiKey;
	err = ioutil.WriteFile(googleServicesConfig, []byte(token), 0644)
	if err != nil {
		log.Fatalln(err)
	}
}