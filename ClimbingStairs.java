public class ClimbingStairs {

//Given a staircase, find the total number of ways to reach the n'th stair from the bottom of the stair 
//when a person can only climb either 1 or 2 stairs at a time

    public static int climbStairs(int n) {
      if(n==1){
        return 1;
      }
      if(n==2){
        return 2;
      }
      return climbStairs(n-1) + climbStairs(n-2);
    }

    public static void main(String[] args) {
      int n = 4;
      System.out.println("Number of ways to climb " + n + " stairs: " + climbStairs(n));
    }

}