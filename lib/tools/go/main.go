package main

import (
	"fmt"
	"log"
	"os"

	"github.com/admiral-team/admiral-tools/client"
	"github.com/joho/godotenv"
)

func main() {
	token := goDotEnvVariable("FIGMA_ACCESS_TOKEN")
	imagesFile := goDotEnvVariable("FIGMA_IMAGES_FILE_KEY")
	colorsFile := goDotEnvVariable("FIGMA_COLORS_FILE_KEY")
	documentationFile := goDotEnvVariable("FIGMA_DOCUMENTATION_FILE_KEY")
	typographyFile := goDotEnvVariable("FIGMA_TYPOGRAPHY_FILE_KEY")

	switch os.Args[1] {
	case "loadDocumentation":
		client.LoadDocumentation(token, documentationFile, "")
	case "loadImages":
		client.LoadImagesFlutter(token, imagesFile)
	case "loadColors":
		client.GetColorsDart(token, colorsFile, "../templates/ColorPalette.go.tmpl", "../../theme/colors_palette.dart")
	case "loadFonts":
		client.GetTypographyDart(token, typographyFile, "../templates/FontPalette.go.tmpl", "../../theme/font_palette.dart")
	default:
		fmt.Println("Unknown command")
	}
}

func goDotEnvVariable(key string) string {
	err := godotenv.Load(".env.secret")

	if err != nil {
		log.Fatalf("Error loading .env file: " + err.Error())
	}

	return os.Getenv(key)
}
