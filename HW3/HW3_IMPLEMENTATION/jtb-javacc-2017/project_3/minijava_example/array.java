class array {
   /* public static void main(String[] a) {
        int[] x;
        int size;
        x = new int[9];
        size=x.length;
        x[0] = 1;
        x[4] = 2;

        System.out.println(size);
    }*/
   public static void main(String[] a) {
       boolean[] x;
       boolean c;
       int size;
       x = new boolean[9];
       x[8]=true;
       x[7]=false;
       c=x[8];
       size=x.length;
       System.out.println(size);
       if (x[7])
           System.out.println(size);
       else
           System.out.println(2);
   }

}