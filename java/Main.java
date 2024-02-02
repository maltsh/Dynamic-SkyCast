// java/Main.java
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Skycast Weather App");

        Label weatherLabel = new Label("Current Weather: Sunny, 25°C");

        StackPane root = new StackPane();
        root.getChildren().add(weatherLabel);

        primaryStage.setScene(new Scene(root, 300, 250));
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
