import org.gradle.api.DefaultTask
import org.gradle.api.tasks.Input
import org.gradle.api.tasks.OutputFile
import org.gradle.api.tasks.TaskAction
import org.gradle.api.tasks.options.Option

abstract class UpdateReleaseNotesTask extends DefaultTask {
    private fileName = "release-notes.txt"

    @OutputFile
    File releaseNotesFile = new File(fileName)

    private String releaseNotes;

    @Option(
            option = "releaseNotes",
            description = "Configures the text to be written to the release notes file."
    )
    public void setUrl(String releaseNotes) {
        this.releaseNotes = releaseNotes;
    }

    @Input
    public String getUrl() {
        return this.releaseNotes;
    }

    @TaskAction
    public void action() {
        releaseNotesFile.createNewFile()
        if (releaseNotes != null) {
            releaseNotesFile.setText(releaseNotes)
        }
    }
}
