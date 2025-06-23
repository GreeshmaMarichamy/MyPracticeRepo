class Logger
{
    private static Logger instance;
    private Logger()
    {
        System.out.println("This is Logger instance");
    }
    public static Logger getInstance()
    {
        if(instance==null)
        {
            instance =new Logger();
        }
        return instance;
    }
    public void log(String s)
    {
        System.out.println("Log: "+s);
    }
    
}