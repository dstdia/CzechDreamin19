public class KafkasTrial {
    
    public static void runCopyOperation(Integer batchSize) {
        
        List<Account> accs = [SELECT ID FROM Account LIMIT :batchsize];
        
        //Logger.log('Running with ' + batchSize + ' records');
        //Logger.push();
        Integer tStart = Limits.getCpuTime();
        //Logger.log('CPU Time START: ' + tStart);
        System.debug('CPU Time START: ' + tStart);
        update accs;
        
        Integer tEnd = Limits.getCpuTime();
        /*Logger.log('CPU Time END: ' + tEnd);
        Logger.log ('Elapsed: ' + (tEnd-tStart));
        Logger.log('Avg. per Record: ' + ((tEnd-tStart)/batchSize));
        Logger.popAll();*/
        System.debug('CPU Time END: ' + tEnd);
        System.debug ('Elapsed: ' + (tEnd-tStart));
        System.debug('Avg. per Record: ' + ((tEnd-tStart)/batchSize));
    }

}