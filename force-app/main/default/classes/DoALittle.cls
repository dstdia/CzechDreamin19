public class DoALittle {
    public static void something(Integer triggerSize) {
        Logger.push();
        somethingPrivate(triggerSize);
        Logger.pop();
    }
    
    private static void somethingPrivate(Integer triggerSize) {
        Logger.push();
        Logger.log('trigger size: ' +triggerSize);
        //doNothing.doLess();
        Logger.pop();
    }
}