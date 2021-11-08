public class Calculator {
    public static float calculate(float first, float second, String operator) {
        float total = 0;
        switch (operator) {
            case "+":
                total = first + second;
                break;
            case "-":
                total = first - second;
                break;
            case "*":
                total = first * second;
                break;
            case "/":
                try {
                    total = first / second;
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
        }
        return total;
    }
}
