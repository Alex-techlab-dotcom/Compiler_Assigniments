/*
class Example {
    public static void main(String[] args) {
      System.out.println((new A().fooo(1,4,new A())));
    }
}

class A {
    int i;
    A a;
    int c;
    int[] arr;

    public A get() {
        return a;
    }

    public int fooo(int i, int j, A a1) {
        int d;
        arr = new int[10];
       // d = (new boolean[3])[3];
        // c=a.fooo(i,j);
        c = arr.length;
        d = arr[(this.fooo(i, j, a1))];
        return i + ((i * j) + (this.f(d)));
    }

    public int f(int k) {
        c = this.f(k);
        return this.f(k);
    }

    public boolean bar(int k, int d) {
        int p;
        return false;
    }
}

class B extends A {
    int i;
    int k;

    public int foobar(boolean k) {
        return (this.get()).f(i);
    }

     public int fooo(int i, int j, A a1) {
        int d;
        arr = new int[10];
        // d = (new boolean[3])[3];
        // c=a.fooo(i,j);
        c = arr.length;
        d = arr[(this.fooo(i, j, a1))];
        return i + ((i * j) + (this.f(d)));
    }
}

class C extends B {
    int i;
    B b;
    boolean d;
    int k;
    A a;

    public int fooo(int i, int j, A a1) {
        a = new B();
        if ((a.bar(i, j)) && (!(3 < 2)))
            k = 1;
        else
            k = 2;
        i = a.fooo(i, this.fooo(i, this.fooo(i, j, a1), a1), b);
        return 1;
    }

    public int test(int i, int j) {
        i = 1;
        return 2;
    }
}

class D{
    int k;
    public int fk(int i, int l) {
        return 1;
    }
}
*/


class Example {
    public static void main(String[] a) {
        int x;
        int y;

        x=1;
        y=2;

        while(x<y){
            System.out.println(x);}
    }
}

class Base {
    int data;
    boolean[] k;
    public int set(int x) {
     // data=2;
      //k=new int[3];
        k=new boolean[10];
        k[1]=true;
        x=1;
        if(k[1]){
            System.out.println(1);
            x=7;
            if (5<x){
                System.out.println(x);
            }else
                System.out.println(5);
        }else
            System.out.println(0);


        while(x<10){
            System.out.println(x);
            x=x+1;
        }
        x=(this.get(data))*(data*(this.get(data)));

        return x;
    }

    public int get(int x) {
        System.out.println(1);
        return x + (this.foo());
    }

    public int foo(){
        int x;
        x=2;
        return x;
    }
}


/*
class Example {

    public static void main(String[] args) {
        B b;
        int rv;
        b = new B();
        rv = b.foo();
        System.out.println(rv);
    }

}


class A {
    public int foo() {
        return 1;
    }

}


class B extends A {


}
*/
/*
class Example{
    public static void main(String[] a){
        System.out.println(new Test().start());
    }
}

class Test{

    int i;
    int k;

    public int start(){

        i = 4;
        k = 0;

        return this.mutual1();
    }

    public int mutual1(){

        int j;
        System.out.println(i);
        i = i - 1;
        System.out.println(i);
        if (i < 0){
            k = 0;
            System.out.println(213);
        }
        else {
            System.out.println(k);
            k = 1;
            j = this.mutual2();
        }

        return k;

    }

    public int mutual2(){

        int j;

        i = i - 1;

        if (i < 0)
            k = 0;
        else {
            System.out.println(k);
            k = 0;
            j = this.mutual1();
        }

        return k;
    }
}*/

/*
class Example {
    public static void main(String[] a) {
       if(!true)
            System.out.println(1);
       else
           System.out.println(2);
    }
}*/
