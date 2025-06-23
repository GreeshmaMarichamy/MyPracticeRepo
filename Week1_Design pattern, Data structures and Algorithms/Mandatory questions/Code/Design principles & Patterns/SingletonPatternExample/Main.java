class Main {
    public static void main(String args[])
    {
        Logger l1=Logger.getInstance();
        l1.log("This is 1st log message");
        Logger l2=Logger.getInstance();
        l2.log("This is 2nd log message");
        if(l1==l2)
        {
            System.out.println("Both logs are same instance");
        }
        else
        {
            System.out.println("Both logs are different instance");
        }
    }
}
