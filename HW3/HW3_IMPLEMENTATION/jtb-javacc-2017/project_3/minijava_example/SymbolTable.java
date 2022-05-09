

import java.util.*;

class Pair<S, S1> implements Comparable<Pair<S, S1>> {
    String VariableName;
    String ClassName;

    int offset;

    public Pair(String x, String y) {
        this.VariableName = x;
        this.ClassName = y;
    }

    public Pair(String x, int y) {
        this.VariableName = x;
        this.offset = y;
    }

    public String toString() {
        return "( " + VariableName + " , " + ClassName + " )";
    }

    public String argumentType() {
        return VariableName;
    }

    public String argumentName() {
        return ClassName;
    }

    public int getOffset() {
        return offset;
    }


    @Override
    public int compareTo(Pair<S, S1> a) {
        // if the string are not equal
        if (this.VariableName.compareTo(a.VariableName) != 0) {
            return this.VariableName.compareTo(a.VariableName);
        } else {
            // we compare lastName if firstNames are equal
            return this.ClassName.compareTo(a.ClassName);
        }
    }

    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + VariableName.hashCode();
        result = 31 * result + ClassName.hashCode();
        return result;
    }
}

class MyType {
    String type;
    boolean isMethod;
    TreeMap<String, String> variablesMap;
    List<Pair<String, String>> methodArgs;

    MyType(String _varType, boolean _isMethod) {
        this.type = _varType;
        this.isMethod = _isMethod;
        this.variablesMap = new TreeMap<>();
        this.methodArgs = new ArrayList<>();
    }
}

class Method {
    String methodName;
    String methodType;
    String classOrigin;
    List<Pair<String, String>> methodArgs;

    Method(String _methodName, String _classOrigin, String _methodType) {
        this.methodName = _methodName;
        this.classOrigin = _classOrigin;
        this.methodType = _methodType;
        this.methodArgs = new ArrayList<>();
    }
}

class Vtable {
    LinkedHashMap<Pair<String, String>, Integer> VTvariables;
    TreeMap<Pair<String, String>, Integer> VTvariablesInTmap;
    TreeMap<Pair<String, String>, Integer> VTmethods;
    LinkedHashMap<Pair<String, String>, Integer> methodDeclarionInorder;
    TreeMap<String, Integer> classMemoryEnd;
    TreeMap<String, Integer> classMemoryEndMethods;
    TreeMap<String, Integer> typeToBytes;
    List<Pair<String, String>> existingMethods;

    Vtable() {
        this.VTvariablesInTmap = new TreeMap<>();
        this.VTvariables = new LinkedHashMap<>();
        this.VTmethods = new TreeMap<>();
        this.classMemoryEnd = new TreeMap<>();
        this.typeToBytes = new TreeMap<>();
        this.classMemoryEndMethods = new TreeMap<>();
        this.existingMethods = new ArrayList<>();
        this.typeToBytes.put("int", 4);
        this.typeToBytes.put("boolean", 1);
        this.typeToBytes.put("boolean[]", 8);
        this.typeToBytes.put("int[]", 8);
        this.methodDeclarionInorder = new LinkedHashMap<>();
    }
}

class LLVM_IR_VTABLE {
    LinkedHashMap<String, List<Method>> irVtable;
    TreeMap<String, String> typeToPrimitiveTypes;

    LinkedHashMap<String, String> registerToType;

    LLVM_IR_VTABLE() {
        this.registerToType = new LinkedHashMap<>();
        this.irVtable = new LinkedHashMap<>();
        this.typeToPrimitiveTypes = new TreeMap<>() {{
            put("int", "i32");
            put("boolean", "i1");
            put("int[]", "i32*");
            put("boolean[]", "i8*");
        }};
    }

}

public class SymbolTable {

    Vtable vtable;

    LLVM_IR_VTABLE llvm_ir_vtable;
    TreeMap<Pair<String, String>, MyType> fieldDeclarationMap;
    TreeMap<Pair<String, String>, MyType> methodDeclaration;
    TreeMap<Pair<String, String>, String> fieldDeclaration;
    List<String> definedClasses;
    List<String> formalTypes;
    List<String> primitiveTypes;
    TreeMap<String, String> inheritsFrom;

    public SymbolTable() {
        this.definedClasses = new ArrayList<>();
        this.fieldDeclarationMap = new TreeMap<>();
        this.formalTypes = new ArrayList<>();
        this.inheritsFrom = new TreeMap<>();
        this.methodDeclaration = new TreeMap<>();
        this.fieldDeclaration = new TreeMap<>();
        this.vtable = new Vtable();
        this.llvm_ir_vtable = new LLVM_IR_VTABLE();
        formalTypes.add("int");
        formalTypes.add("boolean");
        formalTypes.add("int[]");
        formalTypes.add("boolean[]");
        this.primitiveTypes = new ArrayList<>() {{
            add("i32");
            add("i8*");
            add("i32*");
            add("i1");
        }};


    }

    public boolean ExistsInSuperClass(String methodName, String className) {
        while (true) {
            Pair<String, String> methodClassPair = new Pair<>(methodName, className);
            if (this.methodDeclaration.containsKey(methodClassPair)) {
                // if (!TsymbolTable.fieldDeclarationMap.containsKey(methodClassPair)) {
                //we must first check that the className is not the super class of its generation
                return true;
            } else if (!this.inheritsFrom.containsKey(className) && !this.methodDeclaration.containsKey(methodClassPair)) {
                // we reached mother-class and this function doesnt exist
                return false;
            } else
                className = this.inheritsFrom.get(className);
        }
    }

    public int getOffsetFromSC(String methodName, String className) {
        while (true) {
            Pair<String, String> methodClassPair = new Pair<>(methodName, className);
            if (this.methodDeclaration.containsKey(methodClassPair)) {
                // if (!TsymbolTable.fieldDeclarationMap.containsKey(methodClassPair)) {
                //we must first check that the className is not the super class of its generation
                return this.vtable.VTmethods.get(methodClassPair);
            } else
                className = this.inheritsFrom.get(className);
        }
    }

    public void printVtable() {
        int offset = 0;
        String superClass;
        String previousClass = "";
        //System.out.println("size is "+this.vtable.existingMethods.size());
        for (int method = 0; method < this.vtable.existingMethods.size(); method++) {
//            String currentClassName = VTmethods.getKey().ClassName;
//            String methodName = VTmethods.getKey().VariableName;
            String currentClassName = this.vtable.existingMethods.get(method).ClassName;
            String methodName = this.vtable.existingMethods.get(method).VariableName;
            if (!previousClass.equals(currentClassName)) {
                offset = 0;
                //System.out.println();
                //System.out.println("------Class: " + currentClassName + "--------");
                //PRINT THE VARS
                //System.out.println("-------VARS-------");
                for (Map.Entry<Pair<String, String>, Integer> VTvars : this.vtable.VTvariables.entrySet()) {
                    String currentClassName1 = VTvars.getKey().ClassName;
                    String varName = VTvars.getKey().VariableName;
                    this.vtable.VTvariablesInTmap.put(new Pair<>(varName, currentClassName1), VTvars.getValue());
                   /* if (currentClassName.equals(currentClassName1))
                        System.out.println(currentClassName1 + "." + varName + " : " + VTvars.getValue());*/
                }
                //PRINT THE VARS
                //System.out.println("-------METHODS--------");
            }
            if (this.inheritsFrom.containsKey(currentClassName)) {
                //System.out.println("195");
                superClass = this.inheritsFrom.get(currentClassName);
                if (!previousClass.equals(currentClassName)) {
                    offset = this.vtable.classMemoryEndMethods.get(superClass);
                    this.vtable.classMemoryEndMethods.put(currentClassName, offset);
                }
                if (ExistsInSuperClass(methodName, superClass)) {
                    int offsetFromSuperclass = getOffsetFromSC(methodName,superClass);
                    //System.out.println("205");
                    this.vtable.VTmethods.put(new Pair<>(methodName, currentClassName), offsetFromSuperclass);
                    this.vtable.methodDeclarionInorder.put(new Pair<>(methodName, currentClassName), offsetFromSuperclass);
                    previousClass = currentClassName;
                    //offset = this.vtable.classMemoryEndMethods.get(superClass);
                    continue;
                }

                /*if (!previousClass.equals(currentClassName))
                    offset = this.vtable.classMemoryEndMethods.get(superClass);*/
            }

            // if (ExistsInSuperClass(methodName))
            this.vtable.VTmethods.put(new Pair<>(methodName, currentClassName), offset);
            this.vtable.methodDeclarionInorder.put(new Pair<>(methodName, currentClassName), offset);
            //System.out.println(currentClassName + "." + methodName + " : " + offset);
            offset += 8;
            this.vtable.classMemoryEndMethods.put(currentClassName, offset);
            previousClass = currentClassName;
        }

        //System.out.println("223 size is "+this.vtable.VTmethods.size());

    }

    public void printST() {
        TreeMap<String, String> mapForPrinting;
        List<Pair<String, String>> methodVarList;
        for (Map.Entry<Pair<String, String>, String> vardec : this.fieldDeclaration.entrySet()) {
            System.out.println("Variable: " + vardec.getKey().VariableName + " Class:" + vardec.getKey().ClassName + " Type: " + vardec.getValue());
        }

        for (Map.Entry<Pair<String, String>, MyType> m : this.methodDeclaration.entrySet()) {
            System.out.println(m.getKey().toString());
            System.out.println("Variable: " + m.getKey().VariableName + " Class:" + m.getKey().ClassName + " Type: " + m.getValue().type);
            if (m.getValue().isMethod) {
                // print the args first
                methodVarList = m.getValue().methodArgs;
                if (!methodVarList.isEmpty()) {
                    System.out.println("args: ");
                    for (int i = 0; i < methodVarList.size(); i++) {
                        System.out.println(methodVarList.get(i).toString());
                    }
                }
                // then print the vars
                mapForPrinting = m.getValue().variablesMap;
                if (!mapForPrinting.isEmpty()) {
                    System.out.println("Method " + m.getKey().VariableName + " contains:");
                    for (Map.Entry<String, String> entries : mapForPrinting.entrySet()) {
                        System.out.println("Variable: " + entries.getKey() + " Type: " + entries.getValue());
                    }
                }
            }
        }
    }


}