package main

import (
	"context"
	"fmt"
	"log"
	"main/auth"
	"main/demo"
	"main/issues"
	"main/release"
	"main/telegram"
	"main/config"
	"os"
	"strconv"

	"github.com/joho/godotenv"
)

func main() {
	envError := godotenv.Load(".env")

	if envError != nil {
		log.Fatal("Cannot read .env file")
	}

	ctx := context.Background()

	switch os.Args[1] {
	case "createComment":
		client := auth.GithubClient(os.Args[3], ctx)
		telegramChatId, _ := strconv.Atoi(os.Args[4])
		buildInfo := configureBuildInfo(os.Args[2])
		formatedBuildInfo := buildInfo.formatted_build_info_git()
		formatedBuildInfoTelegram := buildInfo.formatted_build_info_telegram()
		telegram.SendTextToTelegramChat(telegramChatId, formatedBuildInfoTelegram, os.Args[5])
		issues.CreateComment(ctx, os.Getenv("OWNER"), os.Getenv("REPO"), buildInfo.PullNumber, formatedBuildInfo, *client)
	case "getIssues":
		client := auth.GithubClient(os.Args[3], ctx)
		issues.GetIssues(ctx, os.Getenv("OWNER"), os.Getenv("REPO"), *client)
	case "createRelease":
		buildInfo := configureBuildInfo(os.Args[2])
		releaseBody := buildInfo.telegram_release_message()
		telegramChatId, _ := strconv.Atoi(os.Args[4])
		release.CreateRelease(ctx, os.Getenv("OWNER"), os.Getenv("REPO"), buildInfo.External_version, os.Args[3])
		telegram.SendTextToTelegramChat(telegramChatId, releaseBody, os.Args[5])
	case "build_failed":
		buildInfo := configureBuildInfo(os.Args[2])
		formatedBuildInfoFailed := buildInfo.build_failed_info(os.Args[5])
		telegramChatId, _ := strconv.Atoi(os.Args[3])
		telegram.SendTextToTelegramChat(telegramChatId, formatedBuildInfoFailed, os.Args[4])
	case "change_remote_project_branch":
		branchName := os.Args[2]
		demo.ChangeRemoteDemoBranch(branchName)
	case "setup_ios_config_files":
		googleApiKey := os.Args[2]
		config.BuildIosConfigFiles(googleApiKey)
	default:
		fmt.Println("Unknown command")
	}
}
