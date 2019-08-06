public class DoNothing {
    public static void doLess() {
		Logger.push();
        Object nothing = null;
        Logger.pop();
    }
}