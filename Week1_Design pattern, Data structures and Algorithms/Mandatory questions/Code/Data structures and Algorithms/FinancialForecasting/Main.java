public class Main {
    public static void main(String[] args) {
        double initialValue = 1000.0;
        double growthRate = 0.1;
        int years = 5;

        double recursiveResult = Forecast.forecastRecursive(initialValue, growthRate, years);
        System.out.println("Recursive Forecast: " + recursiveResult);

        double[] memo = new double[years + 1];
        double memoizedResult = Forecast.forecastMemoized(initialValue, growthRate, years, memo);
        System.out.println("Memoized Forecast: " + memoizedResult);
    }
}
