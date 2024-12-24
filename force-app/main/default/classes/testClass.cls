public with sharing class testClass {
    public testClass() {
      
    }
    public static void returnStrin() {
        System.debug('Returned a string');
    }
    public static Integer returnSum(Integer num1,Integer num2) {
        Integer sum=num1+num2;
        return sum;
    }
}