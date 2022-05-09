class test21{
    public static void main(String[] a){
	System.out.println(new Test().start());
    }
}

class Test{

    public int start(){

	int[] op;
    boolean[] p;
	op = new int[10];
    p=new boolean[10];
	//op[true] = 20;		// TE
    p[2]=op[3];
	return 0;
    }
}
