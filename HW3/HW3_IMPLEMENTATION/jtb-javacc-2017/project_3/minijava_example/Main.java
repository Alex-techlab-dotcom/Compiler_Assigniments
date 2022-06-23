
import syntaxtree.*;
import visitor.*;


import java.io.*;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;


public class Main {


    public static void main(String[] args) throws Exception {

        for (int i = 0; i < args.length; i++) {
            FileInputStream fis = null;
            //System.out.println("Input program " + args[i] + " is going to be converted to LLVM-IR code!");
            try {
                fis = new FileInputStream(args[i]);
                MiniJavaParser parser = new MiniJavaParser(fis);

                Goal root = parser.Goal();

                // System.err.println("Program parsed successfully.");
                 try {
                     Path path = Paths.get(args[i]);
                     Path fileName = path.getFileName();
                     //System.out.println("filename is "+fileName.toString());
                     String[] arrOfStr = fileName.toString().split("\\.");
                     String fileName_ll = arrOfStr[0];
                     //System.out.println("filename is "+fileName_ll);
                     fileName_ll+=".ll";
                     File file = new File(fileName_ll);
                     //Instantiating the PrintStream class
                     //System.out.println("filename is "+fileName_ll);
                     PrintStream stream = new PrintStream(file);
                     System.setOut(stream);

                    SymbolTableAdmin symbolTableAdmin = new SymbolTableAdmin();
                    root.accept(symbolTableAdmin, null);
                    _llvm_ir_constructor llvm_ir_constructor = new _llvm_ir_constructor();
                    llvm_ir_constructor.TsymbolTable = symbolTableAdmin.symbolTable;


                    symbolTableAdmin.symbolTable.printVtable();
                    symbolTableAdmin.constructLLVM_IR_Vtable();
                    llvm_ir_constructor.tc.TsymbolTable = symbolTableAdmin.symbolTable;

                    root.accept(llvm_ir_constructor.tc, null);
                    root.accept(llvm_ir_constructor, null);
                } catch (Exception e) {
                    System.out.println(e);
                    System.out.println("Input program " + args[i] + " could not be converted to LLVM-IR code!");
                } finally {
                    //  System.out.println("The 'try catch' is finished.");
                }


            } catch (ParseException ex) {
                System.out.println(ex.getMessage());
            } catch (FileNotFoundException ex) {
                System.err.println(ex.getMessage());
            } finally {
                try {
                    if (fis != null) fis.close();
                } catch (IOException ex) {
                    System.err.println(ex.getMessage());
                }
            }
        }

    }
}


class TypeChecker extends GJDepthFirst<String, String> {
    public SymbolTable TsymbolTable = new SymbolTable();

    public boolean PolymorphismCheck(String varType, String expressionType) {
        // vartype is super class
        if (TsymbolTable.definedClasses.contains(varType) && TsymbolTable.definedClasses.contains(expressionType)) {
            if (varType.equals(expressionType)) return true;
            boolean isPpolymorphsim = true;
            String superClass = "";
            while (isPpolymorphsim) {
                if (!TsymbolTable.inheritsFrom.containsKey(expressionType)) {
                    // varType now has the value of the super Class of this generation
                    if (!varType.equals(expressionType))
                        throw new IllegalArgumentException("Error: assignment between different classes!");
                }
                superClass = TsymbolTable.inheritsFrom.get(expressionType);
                //System.out.println("superclass after map look up is " + superClass);
                if (superClass.equals(varType)) {
                    // System.out.println("Assignment is finaly correct!");
                    isPpolymorphsim = false;
                } else
                    expressionType = superClass;
            }
            return true;
        }
        return false;
    }

    public String FindMethodVariableType(String varName) {
        String varType = "";
        boolean varIsFound = false;
        // System.out.println("FindMethodVariableType id is "+varName);
        // System.out.println(this.currentMethodScope);
        //System.out.println(this.currentClassScope);
        Pair<String, String> methodClassPair = new Pair<>(this.currentMethodScope, this.currentClassScope);
        //List<Pair<String, String>> methodArguments = TsymbolTable.fieldDeclarationMap.get(methodClassPair).methodArgs;
        //if (TsymbolTable.methodDeclaration.containsKey(methodClassPair))System.out.println(methodClassPair.toString());
        List<Pair<String, String>> methodArguments = TsymbolTable.methodDeclaration.get(methodClassPair).methodArgs;
        // search through the arguments first!
        for (int i = 0; i < methodArguments.size(); i++) {
            if (varName.equals(methodArguments.get(i).argumentName())) {
                varIsFound = true;
                varType = methodArguments.get(i).argumentType();

            }
        }
        if (varIsFound)
            return varType;
        // if var is not found in the arguments then it must be in methodVarMap==method var declarations
        //TreeMap<String, String> varsMethodMap = TsymbolTable.fieldDeclarationMap.get(methodClassPair).variablesMap;
        TreeMap<String, String> varsMethodMap = TsymbolTable.methodDeclaration.get(methodClassPair).variablesMap;
        if (!varIsFound) {
            if (varsMethodMap.containsKey(varName)) {
                varType = varsMethodMap.get(varName);
                varIsFound = true;
            }
        }
        if (varIsFound)
            return varType;
        // finaly a var can be field in the current class or in the superclasses
        String classScopeForThisVar = this.currentClassScope;
        boolean searchingTheSuperClasses = true;
        while (searchingTheSuperClasses) {
            Pair<String, String> varAndClassPair = new Pair<>(varName, classScopeForThisVar);
            //System.out.println(varAndClassPair.toString());
            if (TsymbolTable.fieldDeclaration.containsKey(varAndClassPair)) {
                //System.out.println("we found var c");
                // return TsymbolTable.fieldDeclaration.get(varAndClassPair).type;
                return TsymbolTable.fieldDeclaration.get(varAndClassPair);
            } else {
                if (!TsymbolTable.inheritsFrom.containsKey(classScopeForThisVar))
                    searchingTheSuperClasses = false;
                classScopeForThisVar = TsymbolTable.inheritsFrom.get(classScopeForThisVar);
            }
        }
        if (!varIsFound)
            throw new IllegalArgumentException("class :" + this.currentClassScope + "|method :" + this.currentMethodScope +
                    " Identifier " + varName + " has not been declared!");
        return varType;
    }

    public boolean IsArray(String arrayName, String classScope, String methodScope) {
        String arrayType = "";
        Pair<String, String> arrayClassPair = new Pair<>(arrayName, classScope);
        //if (TsymbolTable.fieldDeclarationMap.containsKey(arrayClassPair)) {
        //  arrayType = TsymbolTable.fieldDeclarationMap.get(arrayClassPair).type;
        //} else {
        arrayType = FindMethodVariableType(arrayName);
        // System.out.println("arrayType is " + arrayType);
        //}

        if (arrayType.equals("int[]") || arrayType.equals("boolean[]"))
            return true;
        return false;
    }

    public String FindArrayType(String arrayName, String classScope, String methodScope) {
        String arrayType = "";
        Pair<String, String> arrayClassPair = new Pair<>(arrayName, classScope);
        //if (TsymbolTable.fieldDeclarationMap.containsKey(arrayClassPair))
        //  arrayType = TsymbolTable.fieldDeclarationMap.get(arrayClassPair).type;
        //else
        arrayType = FindMethodVariableType(arrayName);

        if (arrayType.equals("int[]"))
            return "int[]";
        else if (arrayType.equals("boolean[]"))
            return "boolean[]";
        else
            throw new IllegalArgumentException("Class: " + classScope + " Method: "
                    + methodScope + " " + arrayName + " is not an array Identifier");
    }

    public String FindMethodType(String methodName, String className) {
        while (true) {
            Pair<String, String> methodClassPair = new Pair<>(methodName, className);
            if (!TsymbolTable.methodDeclaration.containsKey(methodClassPair)) {
                // if (!TsymbolTable.fieldDeclarationMap.containsKey(methodClassPair)) {
                //we must first check that the className is not the super class of its generation
                if (TsymbolTable.inheritsFrom.containsKey(className))
                    className = TsymbolTable.inheritsFrom.get(className);
            } else
                // return TsymbolTable.fieldDeclarationMap.get(methodClassPair).type;
                return TsymbolTable.methodDeclaration.get(methodClassPair).type;
        }
    }

    public List<Pair<String, String>> GetMethodArguments(String methodName, String className) {
        // searches for a particular method inside a particular class
        // if this class doent contain the method we want , we must check the super classes
        while (true) {
            Pair<String, String> methodClassPair = new Pair<>(methodName, className);
            if (!TsymbolTable.methodDeclaration.containsKey(methodClassPair)) {
                //we must first check that the className is not the super class of its generation
                if (!TsymbolTable.inheritsFrom.containsKey(className)) return null;
                className = TsymbolTable.inheritsFrom.get(className);
            } else
                return TsymbolTable.methodDeclaration.get(methodClassPair).methodArgs;
        }

    }

    public String currentClassScope;
    public String currentMethodScope;


    private String returnIdentifier = "returnIdentifier";
    private String returnType = "returnType";

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> "public"
     * f4 -> "static"
     * f5 -> "void"
     * f6 -> "main"
     * f7 -> "("
     * f8 -> "String"
     * f9 -> "["
     * f10 -> "]"
     * f11 -> Identifier()
     * f12 -> ")"
     * f13 -> "{"
     * f14 -> ( VarDeclaration() )*
     * f15 -> ( Statement() )*
     * f16 -> "}"
     * f17 -> "}"
     */
    @Override
    public String visit(MainClass mainClass, String argu) throws Exception {
        this.currentClassScope = mainClass.f1.accept(this, null);
        this.currentMethodScope = "main";
        super.visit(mainClass, argu);
        return "";
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> ( VarDeclaration() )*
     * f4 -> ( MethodDeclaration() )*
     * f5 -> "}"
     */
    @Override
    public String visit(ClassDeclaration classDeclaration, String argu) throws Exception {
        this.currentClassScope = classDeclaration.f1.accept(this, this.returnIdentifier);
        classDeclaration.f3.accept(this, null);
        classDeclaration.f4.accept(this, null);
        return "";
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "extends"
     * f3 -> Identifier()
     * f4 -> "{"
     * f5 -> ( VarDeclaration() )*
     * f6 -> ( MethodDeclaration() )*
     * f7 -> "}"
     */
    @Override
    public String visit(ClassExtendsDeclaration n, String argu) throws Exception {
        n.f0.accept(this, argu);
        this.currentClassScope = n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        n.f7.accept(this, argu);
        return "";
    }

    /**
     * f0 -> Block()
     * | AssignmentStatement()
     * | ArrayAssignmentStatement()
     * | IfStatement()
     * | WhileStatement()
     * | PrintStatement()
     */
    public String visit(Statement statement, String argu) throws Exception {
        statement.f0.accept(this, argu);
        return "";
    }

    /**
     * f0 -> Identifier()
     * f1 -> "["
     * f2 -> Expression()
     * f3 -> "]"
     * f4 -> "="
     * f5 -> Expression()
     * f6 -> ";"
     */
    public String visit(ArrayAssignmentStatement n, String argu) throws Exception {
        String arrayName = n.f0.accept(this, argu);
        String arrayType = "";
        if (IsArray(arrayName, this.currentClassScope, this.currentMethodScope))
            arrayType = FindArrayType(arrayName, this.currentClassScope, this.currentMethodScope);
        else
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                    "  " + arrayName + " is not array");
        String expressionType = n.f2.accept(this, argu);
        //System.out.println("in ArrayLookUp exp type is " + expressionType);
        if (!expressionType.equals("int")) {// expressionType here maay hold the name of an identifier!
            if (TsymbolTable.formalTypes.contains(expressionType) || TsymbolTable.definedClasses.contains(expressionType))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                        " [ expression ] must be of type Integer!");
            expressionType = FindMethodVariableType(expressionType);
            if (!expressionType.equals("int"))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                        " [ expression ] must be of type Integer!");
        }

        String assignmentExpType = n.f5.accept(this, argu);
        if (arrayType.equals("int[]")) {
            if (!assignmentExpType.equals("int")) {// expressionType here maay hold the name of an identifier!
                if (TsymbolTable.formalTypes.contains(assignmentExpType) || TsymbolTable.definedClasses.contains(assignmentExpType))
                    throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                            " interger arrays need integer assignments");
                assignmentExpType = FindMethodVariableType(assignmentExpType);
                if (!assignmentExpType.equals("int"))
                    throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                            " interger arrays need integer assignments");
            }
        } else {
            if (!assignmentExpType.equals("boolean")) {// expressionType here maay hold the name of an identifier!
                if (TsymbolTable.formalTypes.contains(assignmentExpType) || TsymbolTable.definedClasses.contains(assignmentExpType))
                    throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                            " boolean arrays need boolean assignments!");
                assignmentExpType = FindMethodVariableType(assignmentExpType);
                if (!assignmentExpType.equals("boolean"))
                    throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                            " boolean arrays need boolean assignments");
            }
        }


        return "";
    }

    /**
     * f0 -> "if"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> Statement()
     * f5 -> "else"
     * f6 -> Statement()
     */
    @Override
    public String visit(IfStatement ifStatement, String argu) throws Exception {
        ifStatement.f0.accept(this, argu);
        // System.out.println("exp type in ifstatament is " + ifStatement.f2.accept(this, argu));
        ifStatement.f4.accept(this, argu);
        ifStatement.f5.accept(this, argu);
        ifStatement.f6.accept(this, argu);
        return "";
    }

    /**
     * f0 -> "while"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> Statement()
     */
    @Override
    public String visit(WhileStatement whileStatement, String argu) throws Exception {
        if (!(whileStatement.f2.accept(this, argu).equals("boolean")))
            throw new IllegalArgumentException("class :" + this.currentClassScope + "|method :" + this.currentMethodScope +
                    " expression in while loop must be of type boolean");
        whileStatement.f4.accept(this, argu);
        return "";
    }

    /**
     * f0 -> "System.out.println"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> ";"
     */
    @Override
    public String visit(PrintStatement printStatement, String argu) throws Exception {
        if (!(printStatement.f2.accept(this, argu).equals("boolean") || printStatement.f2.accept(this, argu).equals("int")))
            throw new IllegalArgumentException("class :" + this.currentClassScope + "|method :" + this.currentMethodScope +
                    " expression in println(...) must be of type boolean or Integer");
        return "";
    }

    /**
     * f0 -> Identifier()
     * f1 -> "="
     * f2 -> Expression()
     * f3 -> ";"
     */
    @Override
    public String visit(AssignmentStatement assignmentStatement, String argu) throws Exception {
        // upperScope usually refers to the method that contains the particular variable
        String upperScope = argu;
        String varType = "";
        String varname = assignmentStatement.f0.accept(this, this.returnIdentifier);
        // System.out.println("var name is " + varname);
        boolean varIsFound = false;
        varType = FindMethodVariableType(varname);
        // Now we need to evaluate the type of the expression , the variable is assigned to!
        String expressionType = assignmentStatement.f2.accept(this, argu);
        if (expressionType.equals("this")) expressionType = this.currentClassScope;
        //System.out.println("exp is " + expressionType);
        //System.out.println("type is " + varType);
        // we must first check for cases of polymorphsim
        if (this.PolymorphismCheck(varType, expressionType)) return "";

        if (!varType.equals(expressionType))
            throw new IllegalArgumentException("class :" + this.currentClassScope + "|method :" + this.currentMethodScope +
                    " Assignment statement has components of different types!" + " id: " + varname + "|type: " + varType + "|exrpType: " + expressionType);
        return "";
    }

    /**
     * f0 -> "public"
     * f1 -> Type()
     * f2 -> Identifier()
     * f3 -> "("
     * f4 -> ( FormalParameterList() )?
     * f5 -> ")"
     * f6 -> "{"
     * f7 -> ( VarDeclaration() )*
     * f8 -> ( Statement() )*
     * f9 -> "return"
     * f10 -> Expression()
     * f11 -> ";"
     * f12 -> "}"
     */
    @Override
    public String visit(MethodDeclaration methodDeclaration, String argu) throws Exception {

        String methodType = methodDeclaration.f1.accept(this, argu);
        //System.out.println(methodType);
        this.currentMethodScope = methodDeclaration.f2.accept(this, this.returnIdentifier);

        methodDeclaration.f4.accept(this, argu);

        methodDeclaration.f7.accept(this, argu);
        methodDeclaration.f8.accept(this, argu);
        String methodReturnType = methodDeclaration.f10.accept(this, argu);
        //System.out.println("return type is "+methodReturnType);
        if (!methodType.equals(methodReturnType) && !PolymorphismCheck(methodType, methodReturnType))
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope
                    + " Return type must be the same as method type!");
        // now  we check for function overloading in the supe classes!
        String currentClassScope = this.currentClassScope;
        if (!TsymbolTable.inheritsFrom.containsKey(currentClassScope)) return "";
        else {
            String superClass = TsymbolTable.inheritsFrom.get(currentClassScope);
            List<Pair<String, String>> MehtodArgsListFromSC = GetMethodArguments(this.currentMethodScope, superClass);
            List<Pair<String, String>> MehtodArgsList = GetMethodArguments(this.currentMethodScope, currentClassScope);
            if (!(MehtodArgsListFromSC == null)) {
                // in this case this method exist in the super classes!
                // return type and argument types must be the same
                if (MehtodArgsListFromSC.size() != MehtodArgsList.size())
                    throw new IllegalArgumentException("Class: " + this.currentClassScope + "|Method: " + this.currentMethodScope
                            + "| Mini java doesnt support function overloading!");
                String methodArgTypeFS, methodArgType;
                for (int i = 0; i < MehtodArgsList.size(); i++) {
                    methodArgType = MehtodArgsList.get(i).argumentType();
                    methodArgTypeFS = MehtodArgsList.get(i).argumentType();
                    if (!methodArgType.equals(methodArgTypeFS))
                        throw new IllegalArgumentException("Class: " + this.currentClassScope + "|Method: " + this.currentMethodScope
                                + "| must have the same argument types with the method declared in the super class");
                }
                String returnTypeFromSCmethod = FindMethodType(this.currentMethodScope, superClass);
                if (!methodType.equals(returnTypeFromSCmethod))
                    throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope
                            + " Return type must be the same as super class method return type !");
            }
        }
        return "";
    }


    /**
     * f0 -> AndExpression()
     * | CompareExpression()
     * | PlusExpression()
     * | MinusExpression()
     * | TimesExpression()
     * | ArrayLookup()
     * | ArrayLength()
     * | MessageSend()
     * | Clause()
     */
    @Override
    public String visit(Expression expression, String argu) throws Exception {
        List<String> types = new ArrayList<>(Arrays.asList("int", "int[]", "boolean", "boolean[]"));
        String result = expression.f0.accept(this, argu);

        if (!(types.contains(result)) && !(TsymbolTable.definedClasses.contains(result))) {

            String r = FindMethodVariableType(result);
            //System.out.println("INSIDE EXPRESSION r :" + r);
            return r;
        }
        //System.out.println("INSIDE EXPRESSION result :"+result);
        return result;
    }

    /**
     * f0 -> "!"
     * f1 -> Clause()
     */
    @Override
    public String visit(NotExpression n, String argu) throws Exception {
        String classueType = n.f1.accept(this, argu);
        if (!(classueType).equals("boolean")) {
            if (TsymbolTable.formalTypes.contains(classueType) || TsymbolTable.definedClasses.contains(classueType))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " clause() is not of type Boolean!");
            classueType = FindMethodVariableType(classueType);
            if (!(classueType).equals("boolean"))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " clause() is not of type Boolean!");
        }
        return "boolean";
    }

    /**
     * f0 -> Clause()
     * f1 -> "&&"
     * f2 -> Clause()
     */
    @Override
    public String visit(AndExpression n, String argu) throws Exception {
        String firstBooleanTerm = n.f0.accept(this, argu);
        if (!firstBooleanTerm.equals("boolean")) {
            if (TsymbolTable.formalTypes.contains(firstBooleanTerm) || TsymbolTable.definedClasses.contains(firstBooleanTerm))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " clause() is not of type Boolean!");
            firstBooleanTerm = FindMethodVariableType(firstBooleanTerm);
            if (!firstBooleanTerm.equals("boolean"))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " clause() is not of type Boolean!");
        }

        String secondBooleanTerm = n.f2.accept(this, argu);

        if (!secondBooleanTerm.equals("boolean")) {
            if (TsymbolTable.formalTypes.contains(secondBooleanTerm) || TsymbolTable.definedClasses.contains(secondBooleanTerm))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " clause() is not of type Boolean!");
            secondBooleanTerm = FindMethodVariableType(secondBooleanTerm);
            if (!secondBooleanTerm.equals("boolean"))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " clause() is not of type Boolean!");
        }

        if (!(firstBooleanTerm.equals(secondBooleanTerm) && firstBooleanTerm.equals("boolean")))
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                    + this.currentMethodScope + " ANDExpression is not of type Boolean!");
        return "boolean";
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "<"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(CompareExpression n, String argu) throws Exception {
        String firstPrimaryExpression = n.f0.accept(this, argu);
        // System.out.println("firstPrimaryExpression is " + firstPrimaryExpression);
        if (!TsymbolTable.formalTypes.contains(firstPrimaryExpression)) {
            firstPrimaryExpression = FindMethodVariableType(firstPrimaryExpression);
        }
        if (!firstPrimaryExpression.equals("int"))
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                    + this.currentMethodScope + " first expression must be of type int");
        String SecondPrimaryExpression = n.f2.accept(this, argu);
        if (!TsymbolTable.formalTypes.contains(SecondPrimaryExpression)) {
            SecondPrimaryExpression = FindMethodVariableType(SecondPrimaryExpression);
        }
        if (!SecondPrimaryExpression.equals("int"))
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                    + this.currentMethodScope + " second expression must be of type int");
        return "boolean";
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "."
     * f2 -> Identifier()
     * f3 -> "("
     * f4 -> ( ExpressionList() )?
     * f5 -> ")"
     */
    @Override
    public String visit(MessageSend messageSend, String argu) throws Exception {
        String className = messageSend.f0.accept(this, argu);
        //System.out.println("classname is " + className);
        String methodName = messageSend.f2.accept(this, null);
        //System.out.println("methodname is " + methodName);
        String expressionList = messageSend.f4.accept(this, null);
        if (expressionList == null) expressionList = "";
        //System.out.println("            EXP LIST = " + expressionList);
        String typeOfClass = "";
        if (TsymbolTable.definedClasses.contains(className))
            typeOfClass = className;
        else {
            if (TsymbolTable.formalTypes.contains(className))
                throw new IllegalArgumentException("Class: " + className + " doesnt accept method calls");
            typeOfClass = FindMethodVariableType(className);
            //System.out.println("type is "+typeOfClass);
            // }
            if (!TsymbolTable.definedClasses.contains(typeOfClass))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " class " + typeOfClass + " is not defined");
        }


        List<Pair<String, String>> methodArgumets = GetMethodArguments(methodName, typeOfClass);
        //System.out.println("HERE IN 640");
        //System.out.println(methodArgumets);
        if (methodArgumets == null) {
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                    + this.currentMethodScope + " .method " + methodName + " is not defined in class: " + typeOfClass);
        }
        // if expreesion list and argsList are empty we return the type
        if (expressionList.isEmpty() && methodArgumets.isEmpty()) {
            //System.out.println("HERE IN 650");
            return FindMethodType(methodName, typeOfClass);
        } else {
            //System.out.println("size compatison");
            //System.out.println(" expression List  "+expressionList);
            // first expressionList and argumentList must be of the same length
            int numOfExpListArguments;
            String[] arrOfStr = expressionList.split(",");
            ;
            if (!expressionList.isEmpty()) {
                numOfExpListArguments = arrOfStr.length;
            } else
                numOfExpListArguments = 0;

            if (!(numOfExpListArguments == methodArgumets.size()))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                        + this.currentMethodScope + " expressionList and argumentList must be of the same length");
            // now each argument must be the same type and in the same order as the method signature
            //System.out.println("num of args "+numOfExpListArguments);
            for (int argumentIndex = 0; argumentIndex < numOfExpListArguments; argumentIndex++) {
                //  System.out.println(" type of arrOfStr: " + arrOfStr[argumentIndex]);
                // System.out.println("argumentlist index: " + methodArgumets.get(argumentIndex).argumentType());
                if (!(arrOfStr[argumentIndex].equals(methodArgumets.get(argumentIndex).argumentType()))) {
                    if (PolymorphismCheck(methodArgumets.get(argumentIndex).argumentType(), arrOfStr[argumentIndex]))
                        continue;
                    else
                        throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: "
                                + this.currentMethodScope + " method " + methodName + " doesnt accept this kind of arguments!");
                }
            }
            //testing is done so we just return the method type
            return FindMethodType(methodName, typeOfClass);
        }

    }

    /**
     * f0 -> Expression()
     * f1 -> ExpressionTail()
     */
    @Override
    public String visit(ExpressionList expressionList, String argu) throws Exception {
      /*  String exp=expressionList.f0.accept(this, argu);
        System.out.println("expression is "+exp);
        String s = expressionList.f1.accept(this, argu);
        if (s != null)

            return expressionList.f0.accept(this, argu) + s;
        else{
            System.out.println("zero args");
            if (expressionList.f0!=null)
                return expressionList.f0.accept(this, argu);
            else
                return "";
        }*/
        String exp = expressionList.f0.accept(this, argu);
        String expTail = expressionList.f1.accept(this, argu);
        if (exp != null && expTail != null)
            return exp + expTail;
        else if (exp != null)
            return exp;
        else
            return "";
    }

    /**
     * f0 -> ( ExpressionTerm() )*
     */
    @Override
    public String visit(ExpressionTail n, String argu) throws Exception {
        String ret = "";
        if (n.f0 != null) {
            for (Node node : n.f0.nodes) {
                ret += node.accept(this, null);
            }
            return ret;
        } else
            return "";
    }

    /**
     * f0 -> ","
     * f1 -> Expression()
     */
    @Override
    public String visit(ExpressionTerm n, String argu) throws Exception {
        return "," + n.f1.accept(this, argu);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "."
     * f2 -> "length"
     */
    @Override
    public String visit(ArrayLength arrayLength, String argu) throws Exception {
        String arrayName = arrayLength.f0.accept(this, argu);
        //first we examine the class fields
        if (arrayName.equals("int[]"))
            return "int";
        else if (arrayName.equals("boolean[]"))
            return "int";
        else if (IsArray(arrayName, this.currentClassScope, this.currentMethodScope))
            return "int";
        else
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                    " .lenght method must be applied to arrayType expression!");
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "["
     * f2 -> PrimaryExpression()
     * f3 -> "]"
     */
    @Override
    public String visit(ArrayLookup arrayLookup, String argu) throws Exception {
        String arrayType = "";
        String arrayName = arrayLookup.f0.accept(this, argu);
        if (arrayName.equals("int[]"))
            arrayType = arrayName;
        else if (arrayName.equals("boolean[]"))
            arrayType = arrayName;
        else {
            if (IsArray(arrayName, this.currentClassScope, this.currentMethodScope))
                arrayType = FindArrayType(arrayName, this.currentClassScope, this.currentMethodScope);
            else
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                        "  " + arrayName + " is not array");
        }

        //System.out.println("array name is "+arrayName);


        String expressionType = arrayLookup.f2.accept(this, argu);
        //System.out.println("in ArrayLookUp exp type is " + expressionType);
        if (!expressionType.equals("int")) {// expressionType here maay hold the name of an identifier!
            if (TsymbolTable.formalTypes.contains(expressionType))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                        " [ expression ] must be of type Integer!");
            expressionType = FindMethodVariableType(expressionType);
            if (!expressionType.equals("int"))
                throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope +
                        " [ expression ] must be of type Integer!");
        }

        if (arrayType.equals("int[]"))
            return "int";
        else
            return "boolean";
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "+"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(PlusExpression plusExpression, String argu) throws Exception {
        String firstTerm = plusExpression.f0.accept(this, argu);
        String secondTerm = plusExpression.f2.accept(this, argu);
        String firstTermType = firstTerm, secondTermType = secondTerm;
        if (!firstTerm.equals("int") && !TsymbolTable.formalTypes.contains(firstTermType))
            firstTermType = FindMethodVariableType(firstTerm);
        if (!secondTerm.equals("int") && !TsymbolTable.formalTypes.contains(secondTerm))
            secondTermType = FindMethodVariableType(secondTerm);
        if (!(firstTermType.equals(secondTermType) && firstTermType.equals("int")))
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope + " PlusExpression is not of type Integer!");
        return "int";
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "-"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(MinusExpression minusExpression, String argu) throws Exception {
        String firstTerm = minusExpression.f0.accept(this, argu);
        String secondTerm = minusExpression.f2.accept(this, argu);
        String firstTermType = firstTerm, secondTermType = secondTerm;
        if (!firstTerm.equals("int") && !TsymbolTable.formalTypes.contains(firstTermType))
            firstTermType = FindMethodVariableType(firstTerm);
        if (!secondTerm.equals("int") && !TsymbolTable.formalTypes.contains(secondTerm))
            secondTermType = FindMethodVariableType(secondTerm);
        if (!(firstTermType.equals(secondTermType) && firstTermType.equals("int")))
            throw new IllegalArgumentException("Class: " + this.currentClassScope +
                    " Method: " + this.currentMethodScope + " PlusExpression is not of type Integer!");
        return "int";
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "*"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(TimesExpression timesExpression, String argu) throws Exception {
        String firstTerm = timesExpression.f0.accept(this, argu);
        String secondTerm = timesExpression.f2.accept(this, argu);
        String firstTermType = firstTerm, secondTermType = secondTerm;
        if (!firstTerm.equals("int") && !TsymbolTable.formalTypes.contains(firstTermType))
            firstTermType = FindMethodVariableType(firstTerm);
        if (!secondTerm.equals("int") && !TsymbolTable.formalTypes.contains(secondTerm))
            secondTermType = FindMethodVariableType(secondTerm);
        if (!(firstTermType.equals(secondTermType) && firstTermType.equals("int")))
            throw new IllegalArgumentException("Class: " + this.currentClassScope + " Method: " + this.currentMethodScope + " Times expression is not of type Integer!");
        return "int";
    }

    /**
     * f0 -> IntegerLiteral()
     * | TrueLiteral()
     * | FalseLiteral()
     * | Identifier()
     * | ThisExpression()
     * | ArrayAllocationExpression()
     * | AllocationExpression()
     * | BracketExpression()
     */
    @Override
    public String visit(PrimaryExpression primaryExpression, String argu) throws Exception {
        return primaryExpression.f0.accept(this, argu);
    }

    /**
     * f0 -> <INTEGER_LITERAL>
     */
    @Override
    public String visit(IntegerLiteral integerLiteral, String argu) throws Exception {
        //System.out.println("INTEGER LITERAL "+integerLiteral.f0.toString());
        return "int";
    }

    /**
     * f0 -> "true"
     */
    @Override
    public String visit(TrueLiteral trueLiteral, String argu) throws Exception {
        return "boolean";
        //trueLiteral.f0.accept(this, argu);
    }

    /**
     * f0 -> "false"
     */
    @Override
    public String visit(FalseLiteral falseLiteral, String argu) throws Exception {
        return "boolean";
        //return falseLiteral.f0.accept(this, argu);
    }

    /**
     * f0 -> <IDENTIFIER>
     */
    @Override
    public String visit(Identifier identifier, String argu) {
        //System.out.println("identifier is "+identifier.f0.toString());
        return identifier.f0.toString();
    }

    /**
     * f0 -> "this"
     */
    @Override
    public String visit(ThisExpression thisExpression, String argu) throws Exception {
        return this.currentClassScope;
    }

    /**
     * f0 -> BooleanArrayAllocationExpression()
     * | IntegerArrayAllocationExpression()
     */
    @Override
    public String visit(ArrayAllocationExpression arrayAllocationExpression, String argu) throws Exception {
        return arrayAllocationExpression.f0.accept(this, argu);
    }

    /**
     * f0 -> "new"
     * f1 -> "boolean"
     * f2 -> "["
     * f3 -> Expression()
     * f4 -> "]"
     */
    public String visit(BooleanArrayAllocationExpression booleanArrayAllocationExpression, String argu) throws Exception {
        String expressionType = booleanArrayAllocationExpression.f3.accept(this, argu);
        if (!expressionType.equals("int")) {
            expressionType = FindMethodVariableType(expressionType);
            if (!expressionType.equals("int"))
                throw new IllegalArgumentException("Expression inside [ ... ] must be of type Integer!");
        }
        return "boolean[]";
    }

    /**
     * f0 -> "new"
     * f1 -> "int"
     * f2 -> "["
     * f3 -> Expression()
     * f4 -> "]"
     */
    @Override
    public String visit(IntegerArrayAllocationExpression integerArrayAllocationExpression, String argu) throws Exception {
        String expressionType = integerArrayAllocationExpression.f3.accept(this, argu);
        if (!expressionType.equals("int")) {
            expressionType = FindMethodVariableType(expressionType);
            if (!expressionType.equals("int"))
                throw new IllegalArgumentException("Expression inside [ ... ] must be of type Integer!");
        }
        return "int[]";
    }

    /**
     * f0 -> "new"
     * f1 -> Identifier()
     * f2 -> "("
     * f3 -> ")"
     */
    @Override
    public String visit(AllocationExpression allocationExpression, String argu) throws Exception {
        String classType = allocationExpression.f1.accept(this, argu);
        // classType must be included in the definedClasses list!
        if (!TsymbolTable.definedClasses.contains(classType))
            throw new IllegalArgumentException("class " + classType + " is not defined!\n");
        return classType;
    }

    /**
     * f0 -> "("
     * f1 -> Expression()
     * f2 -> ")"
     */
    public String visit(BracketExpression bracketExpression, String argu) throws Exception {
        return bracketExpression.f1.accept(this, argu);
    }

    @Override
    public String visit(IntegerArrayType n, String argu) throws Exception {
        return "int[]";
    }

    @Override
    public String visit(BooleanArrayType n, String argu) throws Exception {
        return "boolean[]";
    }

    public String visit(BooleanType n, String argu) {
        return "boolean";
    }

    public String visit(IntegerType n, String argu) {
        return "int";
    }

}


class _llvm_ir_constructor extends GJDepthFirst<String, String> {
    public SymbolTable TsymbolTable = new SymbolTable();
    public TypeChecker tc = new TypeChecker();
    private String currentClassScope;
    private String currentMethodScope;
    private String returnIdentifier = "returnIdentifier";
    private String returnType = "returnType";

    private int tempRegisterCounter = 0;
    private int labelCounter = 0;

    public String FindClassOfField(String fieldName) {
        String classScopeForThisScope = this.currentClassScope;
        boolean searchingTheSuperClasses = true;
        String varType = "";
        boolean varIsFound = false;

        Pair<String, String> methodClassPair = new Pair<>(this.currentMethodScope, this.currentClassScope);

        List<Pair<String, String>> methodArguments = TsymbolTable.methodDeclaration.get(methodClassPair).methodArgs;
        // search through the arguments first!
        for (int i = 0; i < methodArguments.size(); i++) {
            if (fieldName.equals(methodArguments.get(i).argumentName())) {
                varIsFound = true;
            }
        }
        if (varIsFound)
            return "noField";
        // if var is not found in the arguments then it must be in methodVarMap==method var declarations
        //TreeMap<String, String> varsMethodMap = TsymbolTable.fieldDeclarationMap.get(methodClassPair).variablesMap;
        TreeMap<String, String> varsMethodMap = TsymbolTable.methodDeclaration.get(methodClassPair).variablesMap;
        if (!varIsFound) {
            if (varsMethodMap.containsKey(fieldName)) {
                varIsFound = true;
            }
        }
        if (varIsFound)
            return "noField";
        while (searchingTheSuperClasses) {
            Pair<String, String> fieldAndClassPair = new Pair<>(fieldName, classScopeForThisScope);
            //System.out.println(varAndClassPair.toString());
            if (TsymbolTable.fieldDeclaration.containsKey(fieldAndClassPair)) {
                //System.out.println("we found var c");
                // return TsymbolTable.fieldDeclaration.get(varAndClassPair).type;
                return classScopeForThisScope;
            } else {
                if (!TsymbolTable.inheritsFrom.containsKey(classScopeForThisScope))
                    searchingTheSuperClasses = false;
                classScopeForThisScope = TsymbolTable.inheritsFrom.get(classScopeForThisScope);
            }
        }
        return "noField";
    }

    public String FindMethodVariableType(String varName) {
        String varType = "";
        boolean varIsFound = false;
        // System.out.println("FindMethodVariableType id is "+varName);
        // System.out.println(this.currentMethodScope);
        //System.out.println(this.currentClassScope);
        Pair<String, String> methodClassPair = new Pair<>(this.currentMethodScope, this.currentClassScope);
        //List<Pair<String, String>> methodArguments = TsymbolTable.fieldDeclarationMap.get(methodClassPair).methodArgs;
        //if (TsymbolTable.methodDeclaration.containsKey(methodClassPair))System.out.println(methodClassPair.toString());
        List<Pair<String, String>> methodArguments = TsymbolTable.methodDeclaration.get(methodClassPair).methodArgs;
        // search through the arguments first!
        for (int i = 0; i < methodArguments.size(); i++) {
            if (varName.equals(methodArguments.get(i).argumentName())) {
                varIsFound = true;
                varType = methodArguments.get(i).argumentType();

            }
        }
        if (varIsFound)
            return varType;
        // if var is not found in the arguments then it must be in methodVarMap==method var declarations
        //TreeMap<String, String> varsMethodMap = TsymbolTable.fieldDeclarationMap.get(methodClassPair).variablesMap;
        TreeMap<String, String> varsMethodMap = TsymbolTable.methodDeclaration.get(methodClassPair).variablesMap;
        if (!varIsFound) {
            if (varsMethodMap.containsKey(varName)) {
                varType = varsMethodMap.get(varName);
                varIsFound = true;
            }
        }
        if (varIsFound)
            return varType;
        // finaly a var can be field in the current class or in the superclasses
        String classScopeForThisVar = this.currentClassScope;
        boolean searchingTheSuperClasses = true;
        while (searchingTheSuperClasses) {
            Pair<String, String> varAndClassPair = new Pair<>(varName, classScopeForThisVar);
            //System.out.println(varAndClassPair.toString());
            if (TsymbolTable.fieldDeclaration.containsKey(varAndClassPair)) {
                //System.out.println("we found var c");
                // return TsymbolTable.fieldDeclaration.get(varAndClassPair).type;
                return TsymbolTable.fieldDeclaration.get(varAndClassPair);
            } else {
                if (!TsymbolTable.inheritsFrom.containsKey(classScopeForThisVar))
                    searchingTheSuperClasses = false;
                classScopeForThisVar = TsymbolTable.inheritsFrom.get(classScopeForThisVar);
            }
        }
        if (!varIsFound)
            return "notFound";
        return varType;
    }

    public String returnFieldVR(String field, String classOfField) {
        //System.out.println("1126");
        int fiedlOfset = 8 + TsymbolTable.vtable.VTvariablesInTmap.get(new Pair<>(field, classOfField));
        String varType = TsymbolTable.fieldDeclaration.get(new Pair<>(field, classOfField));
       /* System.out.println("1130 varType is "+varType);
        System.out.println("1131 offset is "+fiedlOfset);*/
        String varPrimitiveType = getPrimitiveType(varType);

        //System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8, i8* %this, " + varPrimitiveType + " " + fiedlOfset);
        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8, i8* %this, i32 " + fiedlOfset);
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* %_" + String.valueOf(tempRegisterCounter - 1) + " to " + varPrimitiveType + "*");
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(tempRegisterCounter), varPrimitiveType + "*");
        tempRegisterCounter++;

       /* System.out.println("    %_"+tempRegisterCounter+" = load "+varPrimitiveType+", "+varPrimitiveType+"* %_"+String.valueOf(tempRegisterCounter-1));
        tempRegisterCounter++;*/
        //System.out.println("1141");
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    public String getPrimitiveType(String formalType) {
        //System.out.println("formal type "+formalType);
        if (!TsymbolTable.llvm_ir_vtable.typeToPrimitiveTypes.containsKey(formalType))
            return "i8*";
        else
            return TsymbolTable.llvm_ir_vtable.typeToPrimitiveTypes.get(formalType);
    }

    /* https://www.javatpoint.com/java-integer-parseint-method */
    public static boolean isNumeric(String string) {
        int intValue;

        //System.out.println(String.format("Parsing string: \"%s\"", string));

        if (string == null || string.equals("")) {
            //System.out.println("String cannot be parsed, it is null or empty.");
            return false;
        }

        try {
            intValue = Integer.parseInt(string);
            return true;
        } catch (NumberFormatException e) {
            //System.out.println("Input String cannot be parsed to Integer.");
        }
        return false;
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> "public"
     * f4 -> "static"
     * f5 -> "void"
     * f6 -> "main"
     * f7 -> "("
     * f8 -> "String"
     * f9 -> "["
     * f10 -> "]"
     * f11 -> Identifier()
     * f12 -> ")"
     * f13 -> "{"
     * f14 -> ( VarDeclaration() )*
     * f15 -> ( Statement() )*
     * f16 -> "}"
     * f17 -> "}"
     */
    @Override
    public String visit(MainClass mainClass, String argu) throws Exception {
        /* @.Classes_vtable = global [0 x i8*] [] */
        String mainClassName = mainClass.f1.accept(this, null);
        this.currentClassScope = mainClassName;
        this.currentMethodScope = "main";
        System.out.println("@." + mainClassName + "_vtable=global[0 x i8*] []");
        /* print the boiler template */
        System.out.println("declare i8* @calloc(i32, i32)\n" +
                "declare i32 @printf(i8*, ...)\n" +
                "declare void @exit(i32)\n" +
                "\n" +
                "@_cint = constant [4 x i8] c\"%d\\0a\\00\"\n" +
                "@_cOOB = constant [15 x i8] c\"Out of bounds\\0a\\00\"\n" +
                "@_cNSZ = constant [15 x i8] c\"Negative size\\0a\\00\"\n" +
                "\n" +
                "define void @print_int(i32 %i) {\n" +
                "    %_str = bitcast [4 x i8]* @_cint to i8*\n" +
                "    call i32 (i8*, ...) @printf(i8* %_str, i32 %i)\n" +
                "    ret void\n" +
                "}\n" +
                "\n" +
                "define void @throw_oob() {\n" +
                "    %_str = bitcast [15 x i8]* @_cOOB to i8*\n" +
                "    call i32 (i8*, ...) @printf(i8* %_str)\n" +
                "    call void @exit(i32 1)\n" +
                "    ret void\n" +
                "}\n" +
                "\n" +
                "define void @throw_nsz() {\n" +
                "    %_str = bitcast [15 x i8]* @_cNSZ to i8*\n" +
                "    call i32 (i8*, ...) @printf(i8* %_str)\n" +
                "    call void @exit(i32 1)\n" +
                "    ret void\n" +
                "}");
        /* Start building the main function of the llvm-ir program */
        System.out.println("define i32 @main() {");
        /* iterate through the var declaration */
        String ret;
        for (Node node : mainClass.f14.nodes) {
            ret = node.accept(this, null);
            String[] arrOfStr = ret.split(" ");
            String varType = arrOfStr[0];
            String varName = arrOfStr[1];
            if (TsymbolTable.definedClasses.contains(varType))
                varType = "i8*";
//            System.out.println("varType "+varType);
//            System.out.println("varname  "+varName);
            System.out.println("    %" + varName + " = alloca " + getPrimitiveType(varType));

        }
        mainClass.f15.accept(this, null);
        System.out.println("    ret i32 0");
        System.out.println("}");
        return "";
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> ( VarDeclaration() )*
     * f4 -> ( MethodDeclaration() )*
     * f5 -> "}"
     */
    @Override
    public String visit(ClassDeclaration classDeclaration, String argu) throws Exception {
        this.currentClassScope = classDeclaration.f1.accept(this, this.returnIdentifier);
        classDeclaration.f3.accept(this, null);
        classDeclaration.f4.accept(this, null);
        return "";
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "extends"
     * f3 -> Identifier()
     * f4 -> "{"
     * f5 -> ( VarDeclaration() )*
     * f6 -> ( MethodDeclaration() )*
     * f7 -> "}"
     */
    @Override
    public String visit(ClassExtendsDeclaration n, String argu) throws Exception {
        n.f0.accept(this, argu);
        this.currentClassScope = n.f1.accept(this, argu);
        n.f2.accept(this, argu);
        n.f3.accept(this, argu);
        n.f4.accept(this, argu);
        n.f5.accept(this, argu);
        n.f6.accept(this, argu);
        n.f7.accept(this, argu);
        return "";
    }

    /**
     * f0 -> Type()
     * f1 -> Identifier()
     * f2 -> ";"
     */
    @Override
    public String visit(VarDeclaration varDeclaration, String argu) throws Exception {
        String varType = varDeclaration.f0.accept(this, null);
        String varName = varDeclaration.f1.accept(this, null);
        return varType + " " + varName;
    }

    /**
     * f0 -> Block()
     * | AssignmentStatement()
     * | ArrayAssignmentStatement()
     * | IfStatement()
     * | WhileStatement()
     * | PrintStatement()
     */
    public String visit(Statement statement, String argu) throws Exception {
        statement.f0.accept(this, argu);
        return " ";
    }

    /**
     * f0 -> Identifier()
     * f1 -> "["
     * f2 -> Expression()
     * f3 -> "]"
     * f4 -> "="
     * f5 -> Expression()
     * f6 -> ";"
     */
    public String visit(ArrayAssignmentStatement arrayAssignmentStatement, String argu) throws Exception {
        System.out.println("    ;code snipet for ArrayAssignmentStatement");

        String arrayName = arrayAssignmentStatement.f0.accept(this, null);
        String classOfField;
        String arrayType = FindMethodVariableType(arrayName);
        String arrayPrimitiveType = getPrimitiveType(arrayType);
        if (!(FindMethodVariableType(arrayName)).equals("notFound")) {
            //System.out.println("varType is " + varType);
            classOfField = FindClassOfField(arrayName);
            if (!classOfField.equals("noField")) {
                arrayName = returnFieldVR(arrayName, classOfField);
            } else
                arrayName = "%" + arrayName;

        }
        String indexRegister = arrayAssignmentStatement.f2.accept(this, null);
        String valueExp = arrayAssignmentStatement.f5.accept(this, null);


        if (arrayPrimitiveType.equals("i32*")) {
            System.out.println("    ;1347");
            System.out.println("    ;Load the address of the " + arrayName + " array");
            System.out.println("    %_" + tempRegisterCounter + " = load " + arrayPrimitiveType + ", " + arrayPrimitiveType + "* " + arrayName);
            String arrayAdressReg = "%_" + tempRegisterCounter;
            tempRegisterCounter++;

            System.out.println("    ; Load the size of the array (first integer of the array)");
            System.out.println("    %_" + tempRegisterCounter + " = load i32, i32* " + arrayAdressReg);
            String sizeOfArrayReg = " %_" + tempRegisterCounter;
            tempRegisterCounter++;

            System.out.println("     ; Check that the index is greater than zero");
            System.out.println("    %_" + tempRegisterCounter + " = icmp sge i32 " + indexRegister + " ,0");
            tempRegisterCounter++;

            System.out.println("    ;Chech that the index is less than the size of the array");
            System.out.println("    %_" + tempRegisterCounter + " = icmp slt i32 " + indexRegister + ", " + sizeOfArrayReg);
            tempRegisterCounter++;

            System.out.println("    %_" + tempRegisterCounter + " = and i1 %_" + String.valueOf(tempRegisterCounter - 1) +
                    ", %_" + String.valueOf(tempRegisterCounter - 2));

            System.out.println("    br i1 %_" + tempRegisterCounter + ", label %oob_ok_" + labelCounter + ", label %oob_err_" + labelCounter);

            System.out.println("    ; Else throw out of bounds exception");
            System.out.println("    oob_err_" + labelCounter + ":");
            System.out.println("    call void @throw_oob()");
            System.out.println("    br label %oob_ok_" + labelCounter);

            System.out.println("    ; All ok, we can safely index the array now\n" +
                    "    oob_ok_" + labelCounter + ":");

            labelCounter++;
            tempRegisterCounter++;
            System.out.println("    %_" + tempRegisterCounter + " = add i32 1, " + indexRegister);
            indexRegister = "%_" + tempRegisterCounter;
            tempRegisterCounter++;

            System.out.println("    ; Get pointer to the i + 1 element of the array (x + i + 1)");
            System.out.println("    %_" + tempRegisterCounter + " = getelementptr i32, " + arrayPrimitiveType + " " + arrayAdressReg + " , i32 " + indexRegister);

            System.out.println("     ; And store value to that address *" + arrayAdressReg + " = value");
            System.out.println("    store i32 " + valueExp + ", " + arrayPrimitiveType + " %_" + tempRegisterCounter);
            tempRegisterCounter++;
            System.out.println("\n");
            return "";
        }

        if (valueExp.equals("true")) {
            System.out.println("    %_" + tempRegisterCounter + " = add i1 1, 0");
            valueExp = "%_" + tempRegisterCounter;
            tempRegisterCounter++;
        } else if (valueExp.equals("false")) {
            System.out.println("    %_" + tempRegisterCounter + " = add i1 0, 0");
            valueExp = "%_" + tempRegisterCounter;
            tempRegisterCounter++;
        }

        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8* , i8** " + arrayName + ", i32 0");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = load i8* , i8** %_" + String.valueOf(tempRegisterCounter - 1));
        String arrayAdressReg = "%_" + tempRegisterCounter;
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* %_" + String.valueOf(tempRegisterCounter - 1) + " to i32*");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i32 , i32* %_" + String.valueOf(tempRegisterCounter - 1) + ", i32 -1");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = load i32 , i32* %_" + String.valueOf(tempRegisterCounter - 1));
        String sizeOfArrayReg = " %_" + tempRegisterCounter;
        tempRegisterCounter++;



       /* System.out.println("    ;Load the address of the " + arrayName + " array");
        System.out.println("    %_" + tempRegisterCounter + " = load " + arrayPrimitiveType + ", " + arrayPrimitiveType + "* %" + arrayName);
        String arrayAdressReg = "%_" + tempRegisterCounter;
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* %_" + String.valueOf(tempRegisterCounter - 1) + " to i32*");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i32, i32* %_" + String.valueOf(tempRegisterCounter - 1) + ", i32 -1");
        String sizeOfArrayReg = "%_" + tempRegisterCounter;
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = load i32, i32* " + String.valueOf(tempRegisterCounter - 1));
        indexRegister = "%_" + tempRegisterCounter;
        tempRegisterCounter++;*/

       /* System.out.println("     ; Check that the index is greater than zero");
        System.out.println("    %_" + tempRegisterCounter + " = icmp sge i32 " + indexRegister + " ,0");
        tempRegisterCounter++;*/

        System.out.println("     ; Check that the index is greater than zero");
        System.out.println("    %_" + tempRegisterCounter + " = icmp sge i32 " + indexRegister + " ,0");
        tempRegisterCounter++;

        System.out.println("    ;Chech that the index is less than the size of the array");
        System.out.println("    %_" + tempRegisterCounter + " = icmp slt i32 " + indexRegister + ", " + sizeOfArrayReg);
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = and i1 %_" + String.valueOf(tempRegisterCounter - 1) +
                ", %_" + String.valueOf(tempRegisterCounter - 2));

        System.out.println("    br i1 %_" + tempRegisterCounter + ", label %oob_ok_" + labelCounter + ", label %oob_err_" + labelCounter);

        System.out.println("    ; Else throw out of bounds exception");
        System.out.println("    oob_err_" + labelCounter + ":");
        System.out.println("    call void @throw_oob()");
        System.out.println("    br label %oob_ok_" + labelCounter);

        System.out.println("    ; All ok, we can safely index the array now\n" +
                "    oob_ok_" + labelCounter + ":");

        labelCounter++;
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8, " + arrayPrimitiveType + " " + arrayAdressReg + " , i32 " + indexRegister);
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = zext i1 " + valueExp + " to i8");
        tempRegisterCounter++;

        System.out.println("    store i8 %_" + String.valueOf(tempRegisterCounter - 1) + " , i8* %_" + String.valueOf(tempRegisterCounter - 2));

        return "";
    }

    /**
     * f0 -> "if"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> Statement()
     * f5 -> "else"
     * f6 -> Statement()
     */
    @Override
    public String visit(IfStatement ifStatement, String argu) throws Exception {
        String ifExpressionRegister = ifStatement.f2.accept(this, argu);
        //String[] arrOfStr = ifExpressionRegister.split("%");
        //ifExpressionRegister = arrOfStr[1];
        int iflabelCounter = labelCounter;
        labelCounter++;
        System.out.println("    br i1 " + ifExpressionRegister + ", label %if_then_" + iflabelCounter + ", label %if_else_" + iflabelCounter);

        System.out.println("    if_then_" + iflabelCounter + ":");
        ifStatement.f4.accept(this, argu);
        System.out.println("    br label %if_end_" + iflabelCounter);

        System.out.println("    if_else_" + iflabelCounter + ":");
        ifStatement.f6.accept(this, argu);
        System.out.println("    br label %if_end_" + iflabelCounter);

        System.out.println("    if_end_" + iflabelCounter + ":");
        return "";
    }

    /**
     * f0 -> "while"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> Statement()
     */
    @Override
    public String visit(WhileStatement whileStatement, String argu) throws Exception {

        int clabelCounter = labelCounter;
        labelCounter++;
        System.out.println("\n  ;while loop");
        System.out.println("br label %whileCond_" + clabelCounter + "\n");
        System.out.println("whileCond_" + clabelCounter + ":");
        String whileExpRegister = whileStatement.f2.accept(this, null);
        System.out.println("br i1" + whileExpRegister + ", label %loop_then_" + clabelCounter + ", label %loop_exit_" + clabelCounter + "\n");
        System.out.println("loop_then_" + clabelCounter + ":");
        whileStatement.f4.accept(this, null);
        System.out.println("br label %whileCond_" + clabelCounter);
        /* we exit the while loop here */
        System.out.println("loop_exit_" + clabelCounter + ":");
        System.out.println("\n");

        return "";
    }

    /**
     * f0 -> "System.out.println"
     * f1 -> "("
     * f2 -> Expression()
     * f3 -> ")"
     * f4 -> ";"
     */
    @Override
    public String visit(PrintStatement printStatement, String argu) throws Exception {
        System.out.println("    ;code snipet for printing");
        String register = printStatement.f2.accept(this, null);
        /*
           Call print with the return value as argument
           call void (i32) @print_int(i32 %_12)
        */
        System.out.println("    call void (i32) @print_int(i32 " + register + ")");
        return "";
    }

    /**
     * f0 -> Identifier()
     * f1 -> "="
     * f2 -> Expression()
     * f3 -> ";"
     */
    @Override
    public String visit(AssignmentStatement assignmentStatement, String argu) throws Exception {
        System.out.println("    ; code snipet for assignment Statemnt");
        String varName = assignmentStatement.f0.accept(this, null);
        /* We need to check if the identifier f0 is a class field */
        String classOfField;
        String expressionRegister = assignmentStatement.f2.accept(this, null);
        String expressionRegisterType;
        if (isNumeric(expressionRegister))
            expressionRegisterType = "i32";
        else if (expressionRegister.equals("false") || expressionRegister.equals("true")) {
            expressionRegisterType = "i1";
            if (expressionRegister.equals("false")) {
                expressionRegister = "0";
            } else
                expressionRegister = "1";
        } else if (expressionRegister.equals("%this")) {
            expressionRegisterType = "i8*";
        } else
            expressionRegisterType = TsymbolTable.llvm_ir_vtable.registerToType.get(expressionRegister);
        String f0register = "%" + varName;
        String varType;
        if (!(varType = FindMethodVariableType(varName)).equals("notFound")) {
            //System.out.println("varType is " + varType);
            classOfField = FindClassOfField(varName);
            if (!classOfField.equals("noField")) {
                f0register = returnFieldVR(varName, classOfField);
            }

            varType = getPrimitiveType(varType);
        }
        System.out.println("    store " + expressionRegisterType + " " + expressionRegister + ", " + expressionRegisterType + "* " + f0register);
        System.out.println("\n");
        return "";

    }

    /**
     * f0 -> "public"
     * f1 -> Type()
     * f2 -> Identifier()
     * f3 -> "("
     * f4 -> ( FormalParameterList() )?
     * f5 -> ")"
     * f6 -> "{"
     * f7 -> ( VarDeclaration() )*
     * f8 -> ( Statement() )*
     * f9 -> "return"
     * f10 -> Expression()
     * f11 -> ";"
     * f12 -> "}"
     */
    @Override
    public String visit(MethodDeclaration methodDeclaration, String argu) throws Exception {
        tempRegisterCounter = 0;
        labelCounter = 0;
        TsymbolTable.llvm_ir_vtable.registerToType.clear();
        String methodType = methodDeclaration.f1.accept(this, null);
     /*   String methodType = methodDeclaration.f1.accept(this, null);
        if (TsymbolTable.definedClasses.contains(methodType))*/
        methodType = getPrimitiveType(methodType);
        String methodName = methodDeclaration.f2.accept(this, null);
        this.currentMethodScope = methodName;
        String methodArgumentsStr = "(i8* %this";
        List<Pair<String, String>> methodArgumentsList = TsymbolTable.methodDeclaration.get(new Pair<>(methodName, this.currentClassScope)).methodArgs;
        for (int arg = 0; arg < methodArgumentsList.size(); arg++) {
            String argumentType = methodArgumentsList.get(arg).argumentType();
            String argumentPrimitiveType = getPrimitiveType(argumentType);
            String argumentName = methodArgumentsList.get(arg).argumentName();
            methodArgumentsStr += ", " + argumentPrimitiveType + " %." + argumentName;
        }
        methodArgumentsStr += ")";
        System.out.println("define " + methodType + " @" + this.currentClassScope + "." + methodName + methodArgumentsStr + "{");
        /* now we allocate some memory space for the method arguments */
        for (int arg = 0; arg < methodArgumentsList.size(); arg++) {
            String argumentType = methodArgumentsList.get(arg).argumentType();
            String argumentPrimitiveType = getPrimitiveType(argumentType);
            String argumentName = methodArgumentsList.get(arg).argumentName();
            /* allocate space first */
            System.out.println("    %" + argumentName + " = alloca " + argumentPrimitiveType);
            /* store the arguments to new variables now */
            System.out.println("    store " + argumentPrimitiveType + " %." + argumentName + ", " + argumentPrimitiveType + "* %" + argumentName);

        }
        // methodDeclaration.f7.accept(this, null);
        /* allocate space for method variables */
        TreeMap<String, String> methodMariablesMap = TsymbolTable.methodDeclaration.get(new Pair<>(methodName, this.currentClassScope)).variablesMap;
        for (Map.Entry<String, String> vardec : methodMariablesMap.entrySet()) {
            String varname = vardec.getKey();
            String varType = vardec.getValue();
            varType = getPrimitiveType(varType);
            System.out.println("    %" + varname + " = alloca " + varType);
        }
        methodDeclaration.f8.accept(this, null);

        String registerToReturn = methodDeclaration.f10.accept(this, null);
        System.out.println("    ret " + methodType + " " + registerToReturn);
        System.out.println("}");
        return "";
    }

    /**
     * f0 -> NotExpression()
     * | PrimaryExpression()
     */
    @Override
    public String visit(Clause n, String argu) throws Exception {
        return n.f0.accept(this, argu);
    }

    /**
     * f0 -> AndExpression()
     * | CompareExpression()
     * | PlusExpression()
     * | MinusExpression()
     * | TimesExpression()
     * | ArrayLookup()
     * | ArrayLength()
     * | MessageSend()
     * | Clause()
     */
    @Override
    public String visit(Expression expression, String argu) throws Exception {
        return expression.f0.accept(this, null);
    }

    /**
     * f0 -> "!"
     * f1 -> Clause()
     */
    @Override
    public String visit(NotExpression notExpression, String argu) throws Exception {
        String resultRegister = notExpression.f1.accept(this, null);
        System.out.println("    %_" + tempRegisterCounter + " = xor i1 " + resultRegister + " , 1");
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i1");
        tempRegisterCounter++;
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> Clause()
     * f1 -> "&&"
     * f2 -> Clause()
     */
    @Override
    public String visit(AndExpression andExpression, String argu) throws Exception {
        System.out.println(" ; Check result, short circuit if false");
        int AlabelCounter = labelCounter;
        labelCounter += 4;
        String leftExpressionRegister = andExpression.f0.accept(this, null);
        System.out.println("    br i1 " + leftExpressionRegister + ", label %exp_res_" + (AlabelCounter + 1) + ", label %exp_res_" + AlabelCounter);
        System.out.println("    exp_res_" + AlabelCounter + ":" + "\n" +
                "    br label %exp_res_" + (AlabelCounter + 3) + "\n");

        System.out.println("    exp_res_" + (AlabelCounter + 1) + ":");
        String rightExpressionRegister = andExpression.f2.accept(this, null);
        System.out.println("    br label %exp_res_" + (AlabelCounter + 2) + "\n");

        System.out.println("   exp_res_" + (AlabelCounter + 2) + ":" + "\n" +
                "    br label %exp_res_" + (AlabelCounter + 3) + "\n");
     /*   System.out.println("      exp_res_" + AlabelCounter + 3 + ":" + "\n" +
                "    %_" + tempRegisterCounter + " = phi i1  [ 0, %exp_res_" + AlabelCounter + " ], [ %_"
                + String.valueOf(tempRegisterCounter - 1) + ", %exp_res_" + AlabelCounter + 2 + " ]");*/
        System.out.println("      exp_res_" + (AlabelCounter + 3) + ":" + "\n" +
                "    %_" + tempRegisterCounter + " = phi i1  [ 0, %exp_res_" + AlabelCounter + " ], [ "
                + rightExpressionRegister + ", %exp_res_" + (AlabelCounter + 2) + " ]");
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i1");
        tempRegisterCounter++;
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "<"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(CompareExpression compareExpression, String argu) throws Exception {
        String f0ExpRegister = compareExpression.f0.accept(this, null);
        String f2ExpRegister = compareExpression.f2.accept(this, null);
        System.out.println("    %_" + tempRegisterCounter + " = icmp slt i32 " + f0ExpRegister + " , " + f2ExpRegister);
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i1");
        tempRegisterCounter++;
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "."
     * f2 -> Identifier()
     * f3 -> "("
     * f4 -> ( ExpressionList() )?
     * f5 -> ")"
     */
    @Override
    public String visit(MessageSend messageSend, String argu) throws Exception {
        //System.out.println("\n---MESSAGE SEND---");
        String tempRegister = messageSend.f0.accept(this, null);
        tc.currentMethodScope = this.currentMethodScope;
        tc.currentClassScope = this.currentClassScope;

        /* we may have retrieved an identifier */
        //System.out.println("tempRegister = " + tempRegister);

        String registerType = messageSend.f0.accept(tc, null);
        if (!FindMethodVariableType(registerType).equals("notFound")) {
            registerType = FindMethodVariableType(registerType);
        }
        //System.out.println("the type is " + registerType);
        String methodName = messageSend.f2.accept(this, null);
        /* we calculate the offset */
        //System.out.println("size is " + TsymbolTable.vtable.VTmethods.size());
        Pair<String, String> methodClassPair = new Pair<>(methodName, registerType);
        //String methodType = TsymbolTable.methodDeclaration.get(methodClassPair).type;
        String methodType = tc.FindMethodType(methodName, registerType);
        String methodPrimitiveType = getPrimitiveType(methodType);
      /*  System.out.println("    ;methodName: "+methodName);
        System.out.println("    ;registerType: "+registerType);*/
        //System.out.println(methodClassPair.toString());
        int offset = 0;
        if (TsymbolTable.vtable.VTmethods.containsKey(new Pair<>(methodName, registerType))){
            offset = TsymbolTable.vtable.VTmethods.get(methodClassPair) / 8;
            System.out.println("    ;offset: "+offset);
        }else{
            /* this method is inherited from a superClass*/
            offset = TsymbolTable.getOffsetFromSC(methodName,registerType) / 8;
            System.out.println("    ;offset: "+offset);
        }


        /*
            First load the object pointer
            %_6 = load i8*, i8** %b
        */
        System.out.println("\n   ;Code snippet for MessageSend\n");
        String registerForObjectPtr;
        if (!tempRegister.equals("this")) {
            registerForObjectPtr = tempRegister;
            System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* " + tempRegister + " to i8***");
            tempRegisterCounter++;
        } else {
            registerForObjectPtr = "%this";
            System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* %this to i8***");
            tempRegisterCounter++;
        }
        /*
            ; Load vtable_ptr
            %_8 = load i8**, i8*** %_7
        */
        System.out.println("    %_" + tempRegisterCounter + " = load i8**, i8*** %_" + String.valueOf(tempRegisterCounter - 1));
        tempRegisterCounter++;
        /*
            ; Get a pointer to the 0-th entry in the vtable. The index here is exactly the
            ; offsets you calculated in the second project (Base:foo).
            %_9 = getelementptr i8*, i8** %_8, i32 0
         */
        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8*, i8** %_" + String.valueOf(tempRegisterCounter - 1) + ", i32 " + offset);
        tempRegisterCounter++;
        /*
            ; Get the actual function pointer
            %_10 = load i8*, i8** %_9
         */
        System.out.println("    %_" + tempRegisterCounter + " = load i8*, i8** %_" + String.valueOf(tempRegisterCounter - 1));
        tempRegisterCounter++;
        /* we need to find the method signature */
        List<Method> myMethods = TsymbolTable.llvm_ir_vtable.irVtable.get(registerType);
        /* iterate through the methods */
        String methodSignature = "";
        for (int method = 0; method < myMethods.size(); method++) {
            if (myMethods.get(method).methodName.equals(methodName)) {
                /* construct the siganture*/
                //methodSignature += TsymbolTable.llvm_ir_vtable.typeToPrimitiveTypes.get(myMethods.get(method).methodType) + "(i8 *";
                methodSignature += methodPrimitiveType + " (i8 *";
                List<Pair<String, String>> methodArguments = myMethods.get(method).methodArgs;
                for (int argType = 0; argType < methodArguments.size(); argType++) {
                    String type = methodArguments.get(argType).argumentType();
                    methodSignature += ", " + getPrimitiveType(type);
                    /*if (!TsymbolTable.llvm_ir_vtable.typeToPrimitiveTypes.containsKey(type))
                        methodSignature += ", i8 *";
                    else
                        methodSignature += ", " + TsymbolTable.llvm_ir_vtable.typeToPrimitiveTypes.get(type);*/
                }
                methodSignature += ")";
            }
        }
            /*
               ; Cast the function pointer from i8* to a function ptr type that matches its signature.
               %_11 = bitcast i8* %_10 to i32 (i8*,i32)*
             */
        int fptrThatMatchesTheSignature = tempRegisterCounter;
        System.out.println("    %_" + fptrThatMatchesTheSignature + " = bitcast i8* %_" + String.valueOf(tempRegisterCounter - 1) + " to " + methodSignature + "*");
        tempRegisterCounter++;
            /*
                ; Perform the call - note the first argument is the receiver object.
                %_12 = call i32 %_11(i8* %_6, i32 1)
            */
        System.out.println("\n    ;Code snippet for performing the call \n");
        int functionResultRegister = tempRegisterCounter;
        String irAguments = " ";
        //System.out.println("before primary");
        String expressionList = "";
        //if (messageSend.f4.accept(this, null) != null) {
        //System.out.println("kkkkk");
        expressionList = messageSend.f4.accept(this, null);
        if (expressionList == null) expressionList = "";
        //}
        //System.out.println("explist is " + expressionList);
        if (expressionList.isEmpty()) {
            System.out.println("    %_" + functionResultRegister + " = call " + methodPrimitiveType + " %_" + fptrThatMatchesTheSignature
                    + "(i8* " + registerForObjectPtr + ")");
            tempRegisterCounter++;
        } else {
            String[] arrOfStr = expressionList.split(",");
            for (int argument = 0; argument < arrOfStr.length; argument++) {
                /* first we check if it is a number */
                if (isNumeric(arrOfStr[argument])) {
                    irAguments += ", i32 " + arrOfStr[argument];
                    continue;
                }
                if (arrOfStr[argument].equals("false")) {
                    irAguments += ", i1 0";
                    continue;
                }
                if (arrOfStr[argument].equals("true")) {
                    irAguments += ", i1 1";
                    continue;
                }
                if (arrOfStr[argument].equals("%this")) {
                    irAguments += ", i8* %this";
                    continue;
                }
                String argRegisterStr = arrOfStr[argument];
                String argumentType = TsymbolTable.llvm_ir_vtable.registerToType.get(argRegisterStr);
                irAguments += ", " + argumentType + " " + argRegisterStr;
            }
            functionResultRegister = tempRegisterCounter;
            System.out.println("    %_" + functionResultRegister + " = call " + methodPrimitiveType + " %_" + fptrThatMatchesTheSignature
                    + "(i8* " + registerForObjectPtr + irAguments + ")");
            tempRegisterCounter++;
        }
        //System.out.println("\n---MESSAGE SEND END---");
        TsymbolTable.llvm_ir_vtable.registerToType.put(String.valueOf("%_" + functionResultRegister), getPrimitiveType(methodType));
        System.out.println();
        return "%_" + functionResultRegister;
    }


    /**
     * f0 -> Expression()
     * f1 -> ExpressionTail()
     */
    @Override
    public String visit(ExpressionList expressionList, String argu) throws Exception {
        String exp = expressionList.f0.accept(this, argu);
        String expTail = expressionList.f1.accept(this, argu);
        if (exp != null && expTail != null)
            return exp + expTail;
        else if (exp != null)
            return exp;
        else
            return "";
    }

    /**
     * f0 -> ( ExpressionTerm() )*
     */
    @Override
    public String visit(ExpressionTail n, String argu) throws Exception {
        String ret = "";
        if (n.f0 != null) {
            for (Node node : n.f0.nodes) {
                ret += node.accept(this, null);
            }
            return ret;
        } else
            return "";
    }

    /**
     * f0 -> ","
     * f1 -> Expression()
     */
    @Override
    public String visit(ExpressionTerm n, String argu) throws Exception {
        return "," + n.f1.accept(this, argu);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "."
     * f2 -> "length"
     */
    @Override
    public String visit(ArrayLength arrayLength, String argu) throws Exception {
        String arrayRegister = arrayLength.f0.accept(this, null);
        String arrayPrimitiveType = TsymbolTable.llvm_ir_vtable.registerToType.get(arrayRegister);
        if (arrayPrimitiveType.equals("i32*")) {
            System.out.println("    %_" + tempRegisterCounter + " = load i32, i32* " + arrayRegister);
            TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i32");
            tempRegisterCounter++;
            return "%_" + String.valueOf(tempRegisterCounter - 1);
        }
      /*  System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8* , i8** " + arrayRegister + ", i32 0");
        tempRegisterCounter++;*/

        /*System.out.println("    %_" + tempRegisterCounter + " = load i8* , i8** " +arrayRegister);
        tempRegisterCounter++;*/

        System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* " + arrayRegister + " to i32*");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i32 , i32* %_" + String.valueOf(tempRegisterCounter - 1) + ", i32 -1");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = load i32 , i32* %_" + String.valueOf(tempRegisterCounter - 1));
        String sizeOfArrayReg = " %_" + tempRegisterCounter;
        TsymbolTable.llvm_ir_vtable.registerToType.put(sizeOfArrayReg, "i32");
        tempRegisterCounter++;

        return sizeOfArrayReg;

    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "["
     * f2 -> PrimaryExpression()
     * f3 -> "]"
     */
    @Override
    public String visit(ArrayLookup arrayLookup, String argu) throws Exception {
        System.out.println("    ;code snipet for arrayLookup");

        String arrayName = arrayLookup.f0.accept(this, null);
        String indexRegister = arrayLookup.f2.accept(this, null);
        //String valueExp= arrayLookup.f5.accept(this,null);
        //String arrayType = TsymbolTable.llvm_ir_vtable.registerToType.get(arrayName);
        String arrayPrimitiveType = TsymbolTable.llvm_ir_vtable.registerToType.get(arrayName);
        String arrayAdressReg = arrayName;
        if (arrayPrimitiveType.equals("i32*")) {

            //tempRegisterCounter++;

            System.out.println("    ; Load the size of the array (first integer of the array)");
            System.out.println("    %_" + tempRegisterCounter + " = load i32, i32* " + arrayAdressReg);
            String sizeOfArrayReg = " %_" + tempRegisterCounter;
            tempRegisterCounter++;

            System.out.println("     ; Check that the index is greater than zero");
            System.out.println("    %_" + tempRegisterCounter + " = icmp sge i32 " + indexRegister + " ,0");
            tempRegisterCounter++;

            System.out.println("    ;Chech that the index is less than the size of the array");
            System.out.println("    %_" + tempRegisterCounter + " = icmp slt i32 " + indexRegister + ", " + sizeOfArrayReg);
            tempRegisterCounter++;

            System.out.println("    %_" + tempRegisterCounter + " = and i1 %_" + String.valueOf(tempRegisterCounter - 1) +
                    ", %_" + String.valueOf(tempRegisterCounter - 2));

            System.out.println("    br i1 %_" + tempRegisterCounter + ", label %oob_ok_" + labelCounter + ", label %oob_err_" + labelCounter);

            System.out.println("    ; Else throw out of bounds exception");
            System.out.println("    oob_err_" + labelCounter + ":");
            System.out.println("    call void @throw_oob()");
            System.out.println("    br label %oob_ok_" + labelCounter);

            System.out.println("    ; All ok, we can safely index the array now\n" +
                    "    oob_ok_" + labelCounter + ":");

            labelCounter++;
            tempRegisterCounter++;
            System.out.println("    %_" + tempRegisterCounter + " = add i32 1, " + indexRegister);
            indexRegister = "%_" + tempRegisterCounter;
            tempRegisterCounter++;

            System.out.println("    ; Get pointer to the i + 1 element of the array (x + i + 1)");
            System.out.println("    %_" + tempRegisterCounter + " = getelementptr i32, i32* " + arrayAdressReg + " , i32 " + indexRegister);

            tempRegisterCounter++;
            System.out.println(" %_" + tempRegisterCounter + " = load i32, i32* %_" + String.valueOf(tempRegisterCounter - 1));
            TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i32");
            tempRegisterCounter++;
            System.out.println("\n");
            return "%_" + String.valueOf(tempRegisterCounter - 1);
        }

       /* System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8 , i8* " + arrayName + ", i32 0");
        tempRegisterCounter++;*/

        /*System.out.println("    %_" + tempRegisterCounter + " = load i8* , i8** " + arrayAdressReg);
        tempRegisterCounter++;*/

        System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* " + arrayAdressReg + " to i32*");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i32 , i32* %_" + String.valueOf(tempRegisterCounter - 1) + ", i32 -1");
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = load i32 , i32* %_" + String.valueOf(tempRegisterCounter - 1));
        String sizeOfArrayReg = " %_" + tempRegisterCounter;
        tempRegisterCounter++;

        System.out.println("     ; Check that the index is greater than zero");
        System.out.println("    %_" + tempRegisterCounter + " = icmp sge i32 " + indexRegister + " ,0");
        tempRegisterCounter++;

        System.out.println("    ;Chech that the index is less than the size of the array");
        System.out.println("    %_" + tempRegisterCounter + " = icmp slt i32 " + indexRegister + ", " + sizeOfArrayReg);
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = and i1 %_" + String.valueOf(tempRegisterCounter - 1) +
                ", %_" + String.valueOf(tempRegisterCounter - 2));

        System.out.println("    br i1 %_" + tempRegisterCounter + ", label %oob_ok_" + labelCounter + ", label %oob_err_" + labelCounter);

        System.out.println("    ; Else throw out of bounds exception");
        System.out.println("    oob_err_" + labelCounter + ":");
        System.out.println("    call void @throw_oob()");
        System.out.println("    br label %oob_ok_" + labelCounter);

        System.out.println("    ; All ok, we can safely index the array now\n" +
                "    oob_ok_" + labelCounter + ":");

        labelCounter++;
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8, " + arrayPrimitiveType + " " + arrayAdressReg + " , i32 " + indexRegister);
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = load i8 , i8* %_" + String.valueOf(tempRegisterCounter - 1));
        tempRegisterCounter++;

        System.out.println("    %_" + tempRegisterCounter + " = trunc i8 %_" + String.valueOf(tempRegisterCounter - 1) + " to i1");

        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i1");
        tempRegisterCounter++;
        System.out.println("\n");
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "+"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(PlusExpression plusExpression, String argu) throws Exception {
        String leftExpression = plusExpression.f0.accept(this, null);
        String rightExpression = plusExpression.f2.accept(this, null);
        System.out.println("    %_" + tempRegisterCounter + " = add i32" + " " + rightExpression + " , " + " " + leftExpression);
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(tempRegisterCounter), "i32");
        tempRegisterCounter++;
        System.out.println("\n");
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "-"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(MinusExpression minusExpression, String argu) throws Exception {
        String leftExpression = minusExpression.f0.accept(this, null);
        String rightExpression = minusExpression.f2.accept(this, null);
        System.out.println("    %_" + tempRegisterCounter + " = sub i32 " + " " + leftExpression + " , " + " " + rightExpression);
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(tempRegisterCounter), "i32");
        tempRegisterCounter++;
        System.out.println("\n");
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> PrimaryExpression()
     * f1 -> "*"
     * f2 -> PrimaryExpression()
     */
    @Override
    public String visit(TimesExpression timesExpression, String argu) throws Exception {
        String leftExpression = timesExpression.f0.accept(this, null);
        String rightExpression = timesExpression.f2.accept(this, null);
        System.out.println("    %_" + tempRegisterCounter + " = mul i32" + " " + rightExpression + " , " + " " + leftExpression);
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(tempRegisterCounter), "i32");
        tempRegisterCounter++;
        System.out.println("\n");
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> IntegerLiteral()
     * | TrueLiteral()
     * | FalseLiteral()
     * | Identifier()
     * | ThisExpression()
     * | ArrayAllocationExpression()
     * | AllocationExpression()
     * | BracketExpression()
     */
    @Override
    public String visit(PrimaryExpression primaryExpression, String argu) throws Exception {
        //System.out.println("---IN PRIMARY EXPRESSION---");
        String result = primaryExpression.f0.accept(this, argu);
        System.out.println("  ;primary: " + result);
        if (this.TsymbolTable.llvm_ir_vtable.typeToPrimitiveTypes.containsKey(result))
            return TsymbolTable.llvm_ir_vtable.typeToPrimitiveTypes.get(result);
        if (result.equals("this"))
            return "%this";

        /* we have an identifier or a register*/
        /* check if identifier is a class field*/
        String expressionRegisterType;
        String classOfField;
        if (!(expressionRegisterType = FindMethodVariableType(result)).equals("notFound")) {
            /* we have a variable */
            /* now check if f2 is a class field*/
            int Register;
            classOfField = FindClassOfField(result);
            if (!classOfField.equals("noField")) {
                result = returnFieldVR(result, classOfField);
                expressionRegisterType = getPrimitiveType(expressionRegisterType);
                Register = tempRegisterCounter;
                System.out.println("    %_" + Register + " = load " + expressionRegisterType + ", " + expressionRegisterType + "* " + result);
                TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(Register), expressionRegisterType);
                tempRegisterCounter++;
                System.out.println(";---IN PRIMARY EXPRESSION END 1838 ---");
                System.out.println("\n");
                return "%_" + Register;
            }
            expressionRegisterType = getPrimitiveType(expressionRegisterType);
            Register = tempRegisterCounter;
            System.out.println("    %_" + Register + " = load " + expressionRegisterType + ", " + expressionRegisterType + "* %" + result);
            TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(Register), expressionRegisterType);
            tempRegisterCounter++;
            System.out.println(";---IN PRIMARY EXPRESSION END 1846---");
            System.out.println("\n");
            return "%_" + Register;

        }
        System.out.println(";---IN PRIMARY EXPRESSION END 1850---");
        System.out.println("\n");
        return result;
    }

    /**
     * f0 -> <INTEGER_LITERAL>
     */
    @Override
    public String visit(IntegerLiteral integerLiteral, String argu) throws Exception {
        return integerLiteral.f0.toString();
    }

    /**
     * f0 -> "true"
     */
    @Override
    public String visit(TrueLiteral trueLiteral, String argu) throws Exception {
        return "true";
    }

    /**
     * f0 -> "false"
     */
    @Override
    public String visit(FalseLiteral falseLiteral, String argu) throws Exception {
        return "false";
    }

    /**
     * f0 -> <IDENTIFIER>
     */
    @Override
    public String visit(Identifier identifier, String argu) {
        return identifier.f0.toString();
    }

    /**
     * f0 -> "this"
     */
    @Override
    public String visit(ThisExpression thisExpression, String argu) throws Exception {
        return "this";
    }

    /**
     * f0 -> BooleanArrayAllocationExpression()
     * | IntegerArrayAllocationExpression()
     */
    @Override
    public String visit(ArrayAllocationExpression arrayAllocationExpression, String argu) throws Exception {
        return arrayAllocationExpression.f0.accept(this, argu);
    }

    /**
     * f0 -> "new"
     * f1 -> "boolean"
     * f2 -> "["
     * f3 -> Expression()
     * f4 -> "]"
     */
    public String visit(BooleanArrayAllocationExpression booleanArrayAllocationExpression, String argu) throws
            Exception {
        System.out.println("    ; code snipet for boolean array allocation! ");
        String sizeOfarrayRegister = booleanArrayAllocationExpression.f3.accept(this, null);

        System.out.println("    %_" + tempRegisterCounter + " = add i32 4 , " + sizeOfarrayRegister);
        tempRegisterCounter++;

        System.out.println("    ; Check that the size of the array is not negative - since we added 1, we just check\n" +
                "    ; that the size is >= 1.");

        System.out.println("    %_" + tempRegisterCounter + " = icmp sge i32 %_" + String.valueOf(tempRegisterCounter - 1) + " , 1");

        System.out.println("    br i1 %_" + tempRegisterCounter + " , label %sizeIsNotNeg_" + labelCounter + ", label %sizeIsNeg_" + labelCounter);

        System.out.println("    ; Size was negative, throw negative size exception");

        System.out.println("    sizeIsNeg_" + labelCounter + ":");
        System.out.println("    call void @throw_nsz()");
        System.out.println("    br label %sizeIsNotNeg_" + labelCounter);

        System.out.println("    ; All ok, we can proceed with the allocation");
        System.out.println("    sizeIsNotNeg_" + labelCounter + ":");

        System.out.println("    ; Allocate sz + 1 integer for size  (4 bytes + size* one_byte)");
        tempRegisterCounter++;
        System.out.println("    %_" + tempRegisterCounter + " = call i8* @calloc( i32 %_" + String.valueOf(tempRegisterCounter - 2) + ", i32 1)");
        tempRegisterCounter++;

        System.out.println("    ; Cast the returned pointer");
        System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* %_" + String.valueOf(tempRegisterCounter - 1) + " to i32*");

        System.out.println("    ; Store the size of the array in the first position of the array");
        System.out.println("    store i32 " + sizeOfarrayRegister + ", i32* %_" + tempRegisterCounter);
        //TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i8*");
        tempRegisterCounter++;
        System.out.println("    %_" + tempRegisterCounter + " = bitcast i32* %_" + String.valueOf(tempRegisterCounter - 1) + " to i8*");
        tempRegisterCounter++;
        System.out.println("    %_" + tempRegisterCounter + " = getelementptr i8, i8* %_" + String.valueOf(tempRegisterCounter - 1) + ", i32 4");
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i8*");
        tempRegisterCounter++;
        System.out.println("\n");
        return "%_" + String.valueOf(tempRegisterCounter - 1);

    }

    /**
     * f0 -> "new"
     * f1 -> "int"
     * f2 -> "["
     * f3 -> Expression()
     * f4 -> "]"
     */
    @Override
    public String visit(IntegerArrayAllocationExpression integerArrayAllocationExpression, String argu) throws
            Exception {
        System.out.println("    ; code snipet for array allocation! ");
        String sizeOfarrayRegister = integerArrayAllocationExpression.f3.accept(this, null);

        System.out.println("    %_" + tempRegisterCounter + " = add i32 1 , " + sizeOfarrayRegister);
        tempRegisterCounter++;

        System.out.println("    ; Check that the size of the array is not negative - since we added 1, we just check\n" +
                "    ; that the size is >= 1.");

        System.out.println("    %_" + tempRegisterCounter + " = icmp sge i32 %_" + String.valueOf(tempRegisterCounter - 1) + " , 1");

        System.out.println("    br i1 %_" + tempRegisterCounter + " , label %sizeIsNotNeg_" + labelCounter + ", label %sizeIsNeg_" + labelCounter);

        System.out.println("    ; Size was negative, throw negative size exception");

        System.out.println("    sizeIsNeg_" + labelCounter + ":");
        System.out.println("    call void @throw_nsz()");
        System.out.println("    br label %sizeIsNotNeg_" + labelCounter);

        System.out.println("    ; All ok, we can proceed with the allocation");
        System.out.println("    sizeIsNotNeg_" + labelCounter + ":");

        System.out.println("    ; Allocate sz + 1 integers (4 bytes each)");
        tempRegisterCounter++;
        System.out.println("    %_" + tempRegisterCounter + " = call i8* @calloc( i32 %_" + String.valueOf(tempRegisterCounter - 2) + ", i32 4)");
        tempRegisterCounter++;

        System.out.println("    ; Cast the returned pointer");
        System.out.println("    %_" + tempRegisterCounter + " = bitcast i8* %_" + String.valueOf(tempRegisterCounter - 1) + " to i32*");

        System.out.println("    ; Store the size of the array in the first position of the array");
        System.out.println("    store i32 " + sizeOfarrayRegister + ", i32* %_" + tempRegisterCounter);
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + tempRegisterCounter, "i32*");
        tempRegisterCounter++;
        System.out.println("\n");
        return "%_" + String.valueOf(tempRegisterCounter - 1);
    }

    /**
     * f0 -> "new"
     * f1 -> Identifier()
     * f2 -> "("
     * f3 -> ")"
     */
    @Override
    public String visit(AllocationExpression allocationExpression, String argu) throws Exception {
        String classForAllocation = allocationExpression.f1.accept(this, null);
        //System.out.println("classForAllocation is " + classForAllocation);
        int totalFieldSizeOfClass = 8 + TsymbolTable.vtable.classMemoryEnd.get(classForAllocation);
        //totalFieldSizeOfClass += TsymbolTable.vtable.classMemoryEnd.get(classForAllocation);
        //System.out.println("size is "+totalFieldSizeOfClass);
        /* %_register = call i8* @calloc(i32 1, i32 sizeOfClass) */
        String register = "%_" + String.valueOf(tempRegisterCounter);
        //System.out.println(register);
        TsymbolTable.llvm_ir_vtable.registerToType.put(register, "i8 *");
        tempRegisterCounter++;
        System.out.println("    " + register + " = call i8* @calloc(i32 1, i32 " + totalFieldSizeOfClass + ")");

       /* ; Next we need to set the vtable pointer to point to the correct vtable (Base_vtable)
        ; First we bitcast the object pointer from i8* to i8***
        ; This is done because:
        ;   -> The vtable stores values of type i8*.
        ;   -> Thus, a pointer that points at the start of the vtable (equivalently at the first entry
        ;      of the vtable) must have type i8**.
        ;   -> Thus, to set the vtable pointer at the start of the object, we need to have it's address
        ;      (first byte of the object) in a register of type i8***.
        %_1 = bitcast i8* %_0 to i8***
        */
        System.out.println("    %_" + String.valueOf(tempRegisterCounter) + " = bitcast i8* " + register + " to i8***");
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(tempRegisterCounter), "i8***");
        tempRegisterCounter++;
        /*; Get the address of the first element of the classForAllocation_vtable
                ; The getelementptr arguments are as follows:
        ;   * The first argument is the type of elements our classForAllocation_vtable ptr points to.
        ;   * The second argument is the classForAllocation_vtable ptr.
        ;   * The third and fourth arguments are indexes
        %_2 = getelementptr [numOfMethods x i8*], [numOfMethods x i8*]* @.classForAllocation_vtable, i32 0, i32 0
        */
        int numOfMethods = 0;
        if (!this.TsymbolTable.llvm_ir_vtable.irVtable.get(classForAllocation).isEmpty())
            numOfMethods = this.TsymbolTable.llvm_ir_vtable.irVtable.get(classForAllocation).size();
        //if (numOfMethods==null)
        System.out.println("    %_" + String.valueOf(tempRegisterCounter) + " = getelementptr [" + numOfMethods + " x i8*], [" + numOfMethods + " x i8*]* @."
                + classForAllocation + "_vtable, i32 0, i32 0");
        TsymbolTable.llvm_ir_vtable.registerToType.put("%_" + String.valueOf(tempRegisterCounter), "i8**");
         /*
         Set the vtable to the correct address.
         store i8** %_2, i8*** %_1
         */
        System.out.println("    store i8** %_" + String.valueOf(tempRegisterCounter) + ", i8*** %_" + String.valueOf(tempRegisterCounter - 1));
        tempRegisterCounter++;
        String registerToReturn = "%_" + String.valueOf(tempRegisterCounter - 3);
        System.out.println("\n");
        //System.out.println(registerToReturn);
        return registerToReturn;
    }

    /**
     * f0 -> "("
     * f1 -> Expression()
     * f2 -> ")"
     */
    public String visit(BracketExpression bracketExpression, String argu) throws Exception {
        return bracketExpression.f1.accept(this, argu);
    }

    @Override
    public String visit(IntegerArrayType n, String argu) throws Exception {
        return "int[]";
    }

    @Override
    public String visit(BooleanArrayType n, String argu) throws Exception {
        return "boolean[]";
    }

    public String visit(BooleanType n, String argu) {
        return "boolean";
    }

    public String visit(IntegerType n, String argu) {
        return "int";
    }

}


class SymbolTableAdmin extends GJDepthFirst<String, String> {

    public SymbolTable symbolTable = new SymbolTable();
    String currentClassScope;
    String currentMethodScope;

    String classThatContainsMain;

    public void constructLLVM_IR_Vtable() {
        String previousClass = "";
        String superClass;
        boolean isChild = false;
        for (int definedClass = 0; definedClass < symbolTable.definedClasses.size(); definedClass++) {
            String className = symbolTable.definedClasses.get(definedClass);
            this.symbolTable.llvm_ir_vtable.irVtable.put(className, new ArrayList<>());
        }
        for (Map.Entry<Pair<String, String>, Integer> VTmethods : symbolTable.vtable.methodDeclarionInorder.entrySet()) {
            String currentClassName1 = VTmethods.getKey().ClassName;
            //System.out.println("class is " + currentClassName1);
            if (!previousClass.equals(currentClassName1)) {
                List<Method> parentMethods = null;
                /* for each Class we have a list with all the methods! */
                if (symbolTable.inheritsFrom.containsKey(currentClassName1)) {
                    superClass = symbolTable.inheritsFrom.get(currentClassName1);
                    parentMethods = this.symbolTable.llvm_ir_vtable.irVtable.get(superClass);
                    isChild = true;
                }
                //this.symbolTable.llvm_ir_vtable.irVtable.put(currentClassName1, new ArrayList<>());
                /* it inherits all the methods from his father! */
                if (isChild) {
                    isChild = false;
                    superClass = "";
                    this.symbolTable.llvm_ir_vtable.irVtable.get(currentClassName1).addAll(parentMethods);
                }

            }

            String methodName = VTmethods.getKey().VariableName;
            Pair<String, String> methodClassPair = new Pair<>(methodName, currentClassName1);
            String methodType = symbolTable.methodDeclaration.get(methodClassPair).type;
            Method myMethod = new Method(methodName, currentClassName1, methodType);

            /* we are going to check for the arguments from the symbol Table*/
            List<Pair<String, String>> methodArguments = symbolTable.methodDeclaration.get(VTmethods.getKey()).methodArgs;

            //System.out.println(methodName + " has ARGS:");
            /* we pass all the arguments to myMethod */
            myMethod.methodArgs.addAll(methodArguments);

            /* we expand the method-list of the particular Class*/
            /* But, first we have to check for overriden methods */
            boolean overridenFlag = false;
            List<Method> existingMethods = this.symbolTable.llvm_ir_vtable.irVtable.get(currentClassName1);
            for (int method = 0; method < existingMethods.size(); method++) {
                if (myMethod.methodName.equals(existingMethods.get(method).methodName)) {
                    existingMethods.remove(method);
                    this.symbolTable.llvm_ir_vtable.irVtable.get(currentClassName1).add(method, myMethod);
                    overridenFlag = true;
                    break;
                }
            }
            if (!overridenFlag)
                this.symbolTable.llvm_ir_vtable.irVtable.get(currentClassName1).add(myMethod);

            //System.out.println(currentClassName1 + "." + methodName);
            previousClass = currentClassName1;
        }

        /*@.Derived_vtable = global[2 x i8*] [
        i8 * bitcast(i32(i8 *, i32) * @Derived.set to i8 *),
        i8 * bitcast(i32(i8 *) * @Base.get to i8 *)
        ]*/

        for (Map.Entry<String, List<Method>> ClassMethods : symbolTable.llvm_ir_vtable.irVtable.entrySet()) {
            List<Method> classMethds = ClassMethods.getValue();
            String className = ClassMethods.getKey();
            String sc;
            if (symbolTable.inheritsFrom.containsKey(className)) {
                sc = symbolTable.inheritsFrom.get(className);
                //System.out.println("father is " + sc);
                if (classMethds.isEmpty())
                    classMethds.addAll(symbolTable.llvm_ir_vtable.irVtable.get(sc));
            }
            String methodToIr = "@." + className + "_vtable=global[" + classMethds.size() + " x i8*] [\n";
            String methodReturnType = "";
            //System.out.println(className+"_vtable=global["+classMethds.size()+" x i8*] [");
            for (int func = 0; func < classMethds.size(); func++) {
                methodReturnType = classMethds.get(func).methodType;
                if (!symbolTable.llvm_ir_vtable.typeToPrimitiveTypes.containsKey(methodReturnType))
                    methodToIr += "\ti8 * bitcast(i8 *(i8 *";
                else
                    methodToIr += "\ti8 * bitcast(" + symbolTable.llvm_ir_vtable.typeToPrimitiveTypes.get(methodReturnType) + "(i8 *";
                //System.out.println(classMethds.get(func).methodName);
                List<Pair<String, String>> methodArguments = classMethds.get(func).methodArgs;
                for (int argType = 0; argType < methodArguments.size(); argType++) {
                    String type = methodArguments.get(argType).argumentType();
                    if (!symbolTable.llvm_ir_vtable.typeToPrimitiveTypes.containsKey(type))
                        methodToIr += ", i8 *";
                    else
                        methodToIr += ", " + symbolTable.llvm_ir_vtable.typeToPrimitiveTypes.get(type);
                }
                methodToIr += ") * @" + classMethds.get(func).classOrigin + "." + classMethds.get(func).methodName + " to i8 *)";
                if (func == classMethds.size() - 1)
                    methodToIr += "\n";
                else
                    methodToIr += ",\n";
            }
            methodToIr += "]";
            System.out.println(methodToIr);
        }
    }

    public String GetclassThatContainsMain() {
        return classThatContainsMain;
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> "public"
     * f4 -> "static"
     * f5 -> "void"
     * f6 -> "main"
     * f7 -> "("
     * f8 -> "String"
     * f9 -> "["
     * f10 -> "]"
     * f11 -> Identifier()
     * f12 -> ")"
     * f13 -> "{"
     * f14 -> ( VarDeclaration() )*
     * f15 -> ( Statement() )*
     * f16 -> "}"
     * f17 -> "}"
     */
    @Override
    public String visit(MainClass mainClass, String argu) throws Exception {

        String classname = mainClass.f1.accept(this, null);
        this.classThatContainsMain = classname;
        //symbolTable.definedClasses.add(classname);
        String methodType = "void";
        String methodName = "main";
        this.currentClassScope = classname;
        this.currentMethodScope = "main";
        Pair<String, String> myPair = new Pair<>(methodName, classname);
        //System.out.println("Class: " + classname);
        //symbolTable.fieldDeclarationMap.put(myPair, new MyType(methodType, true));
        // field the method map
        symbolTable.methodDeclaration.put(myPair, new MyType(methodType, true));
        //symbolTable.vtable.VTmethods.put(myPair,0);
        // we access the variable list of the method
        TreeMap<String, String> methodVarsTreemap = symbolTable.methodDeclaration.get(myPair).variablesMap;
        List<Pair<String, String>> methodArguments = symbolTable.methodDeclaration.get(myPair).methodArgs;
        methodArguments.add(new Pair<>("String[]", mainClass.f11.accept(this, null)));
        // now we fill the symbol table with method variables
        if (mainClass.f14 != null) {
            String methodVars = "";
            for (Node node : mainClass.f14.nodes) {
                methodVars = node.accept(this, null);
                //System.out.println(methodVars);
                String[] arrOfStr = methodVars.split(" ");
                // arrOfStr[0] -> type
                // arrOfStr[1] -> identifier
                // check if the identifier already exists!
                Pair<String, String> typeNamePair = new Pair<>(arrOfStr[0], arrOfStr[1]);
                if (methodVarsTreemap.containsKey(arrOfStr[1]) || methodArguments.contains(typeNamePair))
                    throw new IllegalArgumentException("Variable already defined.");
                methodVarsTreemap.put(arrOfStr[1], arrOfStr[0]);
            }
        }
        super.visit(mainClass, classname);

        System.out.println();

        return null;
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "{"
     * f3 -> ( VarDeclaration() )*
     * f4 -> ( MethodDeclaration() )*
     * f5 -> "}"
     */
    @Override
    public String visit(ClassDeclaration n, String argu) throws Exception {
        String classname = n.f1.accept(this, null);
        //System.out.println("Class: " + classname);
        this.currentClassScope = classname;
        if (symbolTable.definedClasses.contains(classname))
            throw new IllegalArgumentException("class is already defined!\n");
        symbolTable.definedClasses.add(classname);
        int offset = 0;
        String ret = "";
        for (Node node : n.f3.nodes) {
            ret = node.accept(this, null);
            String[] arrOfStr = ret.split(" ");
            Pair<String, String> varClassPair = new Pair<>(arrOfStr[1], classname);
            //System.out.println(varClassPair.toString());
            if (symbolTable.fieldDeclaration.containsKey(varClassPair))
                throw new IllegalArgumentException("Variable " + arrOfStr[1] + " already defined.");
            symbolTable.fieldDeclaration.put(new Pair<>(arrOfStr[1], classname), arrOfStr[0]);

            //System.out.println(arrOfStr[0]);
            int numOfBytes = 0;
            if (symbolTable.vtable.typeToBytes.containsKey(arrOfStr[0]))
                numOfBytes = symbolTable.vtable.typeToBytes.get(arrOfStr[0]);
            else
                numOfBytes = 8;
            if (offset == 0)
                symbolTable.vtable.VTvariables.put(new Pair<>(arrOfStr[1], classname), 0);
            else {
                symbolTable.vtable.VTvariables.put(new Pair<>(arrOfStr[1], classname), offset);
            }
            offset += numOfBytes;
            //System.out.println(ret);
        }
        symbolTable.vtable.classMemoryEnd.put(classname, offset);
        n.f4.accept(this, classname);
        //  super.visit(n, classname);

        System.out.println();

        return null;
    }

    /**
     * f0 -> "class"
     * f1 -> Identifier()
     * f2 -> "extends"
     * f3 -> Identifier()
     * f4 -> "{"
     * f5 -> ( VarDeclaration() )*
     * f6 -> ( MethodDeclaration() )*
     * f7 -> "}"
     */
    @Override
    public String visit(ClassExtendsDeclaration n, String argu) throws Exception {
        String classname = n.f1.accept(this, null);
        //System.out.println("Class: " + classname);
        this.currentClassScope = classname;
        // first we check if the class is already defined!
        if (symbolTable.definedClasses.contains(classname))
            throw new IllegalArgumentException("class is already defined!\n");
        symbolTable.definedClasses.add(classname);
        //symbolTable.vtable.classMemoryEnd.add(new Pair<>(classname,0));

        String superClass = n.f3.accept(this, null);
        // second we check if the super class is defined
        if (!symbolTable.definedClasses.contains(superClass))
            throw new IllegalArgumentException("Superclass is not defined!\n");
//        if (symbolTable.inheritsFrom.containsKey(superClass))
//            throw new IllegalArgumentException("multiLevel inheritance is not accepted!\n");
       /* if (symbolTable.inheritsFrom.containsValue(superClass))
            throw new IllegalArgumentException("hierarchical inheritance is not accepted!\n");*/
        symbolTable.definedClasses.add(classname);

        // classname INFERITSFROM superclass
        symbolTable.inheritsFrom.put(classname, superClass);

        String ret = "";
        int offset = 0;
        int offsetOfsubClass = 0;
        offsetOfsubClass = symbolTable.vtable.classMemoryEnd.get(superClass);
        offset = offsetOfsubClass;
        // visit all nodes that contain var declarations
        for (Node node : n.f5.nodes) {
            ret = node.accept(this, null);
            String[] arrOfStr = ret.split(" ");
            if (symbolTable.fieldDeclaration.containsKey(new Pair<>(arrOfStr[1], classname)))
                throw new IllegalArgumentException("Variable already defined.");
            MyType t = new MyType(arrOfStr[0], false);
            // we fill the symbol table with class variables/fields
            symbolTable.fieldDeclaration.put(new Pair<>(arrOfStr[1], classname), arrOfStr[0]);
            int numOfBytes = 0;
            if (symbolTable.vtable.typeToBytes.containsKey(arrOfStr[0]))
                numOfBytes = symbolTable.vtable.typeToBytes.get(arrOfStr[0]);
            else
                numOfBytes = 8;

            symbolTable.vtable.VTvariables.put(new Pair<>(arrOfStr[1], classname), offset);
            offset += numOfBytes;
            //offsetOfsubClass=symbolTable.vtable.classMemoryEnd.get(superClass);
            // symbolTable.vtable.VTvariables.put(new Pair<>(arrOfStr[1], classname),numOfBytes);
            //System.out.println(ret);
        }
        symbolTable.vtable.classMemoryEnd.put(classname, offset);
        n.f6.accept(this, classname);
        System.out.println();
        return null;
    }


    /**
     * f0 -> Type()
     * f1 -> Identifier()
     * f2 -> ";"
     */
    @Override
    public String visit(VarDeclaration varDeclaration, String argu) throws Exception {
        String varType = varDeclaration.f0.accept(this, null);
        String varName = varDeclaration.f1.accept(this, null);
        return varType + " " + varName;
    }

    /**
     * f0 -> "public"
     * f1 -> Type()
     * f2 -> Identifier()
     * f3 -> "("
     * f4 -> ( FormalParameterList() )?
     * f5 -> ")"
     * f6 -> "{"
     * f7 -> ( VarDeclaration() )*
     * f8 -> ( Statement() )*
     * f9 -> "return"
     * f10 -> Expression()
     * f11 -> ";"
     * f12 -> "}"
     */
    @Override
    public String visit(MethodDeclaration methodDeclaration, String argu) throws Exception {
        // System.out.println("2642");
        String argumentList = methodDeclaration.f4.present() ? methodDeclaration.f4.accept(this, null) : "";

        String methodType = methodDeclaration.f1.accept(this, null);
        String methodName = methodDeclaration.f2.accept(this, null);

        Pair<String, String> myPair = new Pair<>(methodName, argu);
        // System.out.println(myPair.toString());
        if (symbolTable.methodDeclaration.containsKey(myPair))
            throw new IllegalArgumentException("method with this name has already been defined!");
        // we store the pair inside the symbolTable
        symbolTable.methodDeclaration.put(myPair, new MyType(methodType, true));
        //symbolTable.vtable.VTmethods.put(myPair, 0);
        symbolTable.vtable.existingMethods.add(myPair);
        //System.out.println(myPair.toString());
        // we access the variable list of the method
        TreeMap<String, String> methodVarsTreemap = symbolTable.methodDeclaration.get(myPair).variablesMap;
        List<Pair<String, String>> methodArguments = symbolTable.methodDeclaration.get(myPair).methodArgs;
        if (!argumentList.isEmpty()) {
            String[] arrOfStr = argumentList.split(" ");
            for (int i = 0; i < arrOfStr.length; i = i + 2) {
                Pair<String, String> typeNamePair = new Pair<>(arrOfStr[i], arrOfStr[i + 1]);
                // check if the argument already exists!
                if (methodArguments.contains(typeNamePair))
                    throw new IllegalArgumentException("Argument already defined.");
                methodArguments.add(typeNamePair);
            }
        }
        // now we fill the symbol table with method variables
        if (methodDeclaration.f7 != null) {
            String methodVars = "";
            for (Node node : methodDeclaration.f7.nodes) {
                methodVars = node.accept(this, null);
                //System.out.println(methodVars);
                String[] arrOfStr = methodVars.split(" ");
                // arrOfStr[0] -> type
                // arrOfStr[1] -> identifier
                // check if the identifier already exists!
                Pair<String, String> typeNamePair = new Pair<>(arrOfStr[0], arrOfStr[1]);
                //System.out.println(methodVars.toString());
                if (methodVarsTreemap.containsKey(arrOfStr[1]) || methodArguments.contains(typeNamePair))
                    throw new IllegalArgumentException("Variable already defined.");
                for (int i = 0; i < methodArguments.size(); i++) {
                    String argumentName = methodArguments.get(i).argumentName();
                    if (argumentName.equals(arrOfStr[1]))
                        throw new IllegalArgumentException("Variable has the same name with an argument !");
                }
                methodVarsTreemap.put(arrOfStr[1], arrOfStr[0]);
            }
        }
        //System.out.println(methodType + " " + methodName + " -- " + argumentList);
        return null;
    }


    /**
     * f0 -> FormalParameter()
     * f1 -> FormalParameterTail()
     */
    @Override
    public String visit(FormalParameterList n, String argu) throws Exception {
        String ret = n.f0.accept(this, null);

        if (n.f1 != null) {
            ret += n.f1.accept(this, null);
        }

        return ret;
    }

    /**
     * f0 -> FormalParameter()
     * f1 -> FormalParameterTail()
     */
    public String visit(FormalParameterTerm n, String argu) throws Exception {
        return n.f1.accept(this, argu);
    }

    /**
     * f0 -> ","
     * f1 -> FormalParameter()
     */
    @Override
    public String visit(FormalParameterTail n, String argu) throws Exception {
        String ret = "";
        for (Node node : n.f0.nodes) {
            ret += " " + node.accept(this, null);
        }

        return ret;
    }

    /**
     * f0 -> Type()
     * f1 -> Identifier()
     */
    @Override
    public String visit(FormalParameter n, String argu) throws Exception {
        String type = n.f0.accept(this, null);
        String name = n.f1.accept(this, null);
        return type + " " + name;
    }

    @Override
    public String visit(IntegerArrayType n, String argu) throws Exception {
        return "int[]";
    }

    @Override
    public String visit(BooleanArrayType n, String argu) throws Exception {
        return "boolean[]";
    }

    public String visit(BooleanType n, String argu) {
        return "boolean";
    }

    public String visit(IntegerType n, String argu) {
        return "int";
    }

    @Override
    public String visit(Identifier n, String argu) {
        return n.f0.toString();
    }

}



