



@.Element_vtable=global[6 x i8*] [
	i8 * bitcast(i1(i8 *, i32, i32, i1) * @Element.Init to i8 *),
	i8 * bitcast(i32(i8 *) * @Element.GetAge to i8 *),
	i8 * bitcast(i32(i8 *) * @Element.GetSalary to i8 *),
	i8 * bitcast(i1(i8 *) * @Element.GetMarried to i8 *),
	i8 * bitcast(i1(i8 *, i8 *) * @Element.Equal to i8 *),
	i8 * bitcast(i1(i8 *, i32, i32) * @Element.Compare to i8 *)
]
@.List_vtable=global[10 x i8*] [
	i8 * bitcast(i1(i8 *) * @List.Init to i8 *),
	i8 * bitcast(i1(i8 *, i8 *, i8 *, i1) * @List.InitNew to i8 *),
	i8 * bitcast(i8 *(i8 *, i8 *) * @List.Insert to i8 *),
	i8 * bitcast(i1(i8 *, i8 *) * @List.SetNext to i8 *),
	i8 * bitcast(i8 *(i8 *, i8 *) * @List.Delete to i8 *),
	i8 * bitcast(i32(i8 *, i8 *) * @List.Search to i8 *),
	i8 * bitcast(i1(i8 *) * @List.GetEnd to i8 *),
	i8 * bitcast(i8 *(i8 *) * @List.GetElem to i8 *),
	i8 * bitcast(i8 *(i8 *) * @List.GetNext to i8 *),
	i8 * bitcast(i1(i8 *) * @List.Print to i8 *)
]
@.LL_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *) * @LL.Start to i8 *)
]
@.LinkedList_vtable=global[0 x i8*] []
declare i8* @calloc(i32, i32)
declare i32 @printf(i8*, ...)
declare void @exit(i32)

@_cint = constant [4 x i8] c"%d\0a\00"
@_cOOB = constant [15 x i8] c"Out of bounds\0a\00"
@_cNSZ = constant [15 x i8] c"Negative size\0a\00"

define void @print_int(i32 %i) {
    %_str = bitcast [4 x i8]* @_cint to i8*
    call i32 (i8*, ...) @printf(i8* %_str, i32 %i)
    ret void
}

define void @throw_oob() {
    %_str = bitcast [15 x i8]* @_cOOB to i8*
    call i32 (i8*, ...) @printf(i8* %_str)
    call void @exit(i32 1)
    ret void
}

define void @throw_nsz() {
    %_str = bitcast [15 x i8]* @_cNSZ to i8*
    call i32 (i8*, ...) @printf(i8* %_str)
    call void @exit(i32 1)
    ret void
}
define i32 @main() {
    ;code snipet for printing
    %_0 = call i8* @calloc(i32 1, i32 8)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [1 x i8*], [1 x i8*]* @.LL_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_8 = call i32 %_7(i8* %_0)

    call void (i32) @print_int(i32 %_8)
    ret i32 0
}
define i1 @Element.Init(i8* %this, i32 %.v_Age, i32 %.v_Salary, i1 %.v_Married){
    %v_Age = alloca i32
    store i32 %.v_Age, i32* %v_Age
    %v_Salary = alloca i32
    store i32 %.v_Salary, i32* %v_Salary
    %v_Married = alloca i1
    store i1 %.v_Married, i1* %v_Married
    ; code snipet for assignment Statemnt
  ;primary: v_Age
    %_0 = load i32, i32* %v_Age
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 8
    %_2 = bitcast i8* %_1 to i32*
    store i32 %_0, i32* %_2


    ; code snipet for assignment Statemnt
  ;primary: v_Salary
    %_3 = load i32, i32* %v_Salary
;---IN PRIMARY EXPRESSION END 1846---


    %_4 = getelementptr i8, i8* %this, i32 12
    %_5 = bitcast i8* %_4 to i32*
    store i32 %_3, i32* %_5


    ; code snipet for assignment Statemnt
  ;primary: v_Married
    %_6 = load i1, i1* %v_Married
;---IN PRIMARY EXPRESSION END 1846---


    %_7 = getelementptr i8, i8* %this, i32 16
    %_8 = bitcast i8* %_7 to i1*
    store i1 %_6, i1* %_8


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i32 @Element.GetAge(i8* %this){
  ;primary: Age
    %_0 = getelementptr i8, i8* %this, i32 8
    %_1 = bitcast i8* %_0 to i32*
    %_2 = load i32, i32* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i32 %_2
}
define i32 @Element.GetSalary(i8* %this){
  ;primary: Salary
    %_0 = getelementptr i8, i8* %this, i32 12
    %_1 = bitcast i8* %_0 to i32*
    %_2 = load i32, i32* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i32 %_2
}
define i1 @Element.GetMarried(i8* %this){
  ;primary: Married
    %_0 = getelementptr i8, i8* %this, i32 16
    %_1 = bitcast i8* %_0 to i1*
    %_2 = load i1, i1* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i1 %_2
}
define i1 @Element.Equal(i8* %this, i8* %.other){
    %other = alloca i8*
    store i8* %.other, i8** %other
    %aux01 = alloca i32
    %aux02 = alloca i32
    %nt = alloca i32
    %ret_val = alloca i1
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %ret_val


    ; code snipet for assignment Statemnt
  ;primary: other
    %_0 = load i8*, i8** %other
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_1 = bitcast i8* %_0 to i8***
    %_2 = load i8**, i8*** %_1
    %_3 = getelementptr i8*, i8** %_2, i32 1
    %_4 = load i8*, i8** %_3
    %_5 = bitcast i8* %_4 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_6 = call i32 %_5(i8* %_0)

    store i32 %_6, i32* %aux01


  ;primary: this

   ;Code snippet for MessageSend

    %_7 = bitcast i8* %this to i8***
    %_8 = load i8**, i8*** %_7
    %_9 = getelementptr i8*, i8** %_8, i32 5
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i1 (i8 *, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: aux01
    %_12 = load i32, i32* %aux01
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: Age
    %_13 = getelementptr i8, i8* %this, i32 8
    %_14 = bitcast i8* %_13 to i32*
    %_15 = load i32, i32* %_14
;---IN PRIMARY EXPRESSION END 1838 ---


    %_16 = call i1 %_11(i8* %this , i32 %_12, i32 %_15)

  ;primary: %_16
;---IN PRIMARY EXPRESSION END 1850---


    %_17 = xor i1 %_16 , 1
    br i1 %_17, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ret_val


    br label %if_end_0
    if_else_0:
    ; code snipet for assignment Statemnt
  ;primary: other
    %_18 = load i8*, i8** %other
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_19 = bitcast i8* %_18 to i8***
    %_20 = load i8**, i8*** %_19
    %_21 = getelementptr i8*, i8** %_20, i32 2
    %_22 = load i8*, i8** %_21
    %_23 = bitcast i8* %_22 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_24 = call i32 %_23(i8* %_18)

    store i32 %_24, i32* %aux02


  ;primary: this

   ;Code snippet for MessageSend

    %_25 = bitcast i8* %this to i8***
    %_26 = load i8**, i8*** %_25
    %_27 = getelementptr i8*, i8** %_26, i32 5
    %_28 = load i8*, i8** %_27
    %_29 = bitcast i8* %_28 to i1 (i8 *, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: aux02
    %_30 = load i32, i32* %aux02
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: Salary
    %_31 = getelementptr i8, i8* %this, i32 12
    %_32 = bitcast i8* %_31 to i32*
    %_33 = load i32, i32* %_32
;---IN PRIMARY EXPRESSION END 1838 ---


    %_34 = call i1 %_29(i8* %this , i32 %_30, i32 %_33)

  ;primary: %_34
;---IN PRIMARY EXPRESSION END 1850---


    %_35 = xor i1 %_34 , 1
    br i1 %_35, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ret_val


    br label %if_end_1
    if_else_1:
  ;primary: Married
    %_36 = getelementptr i8, i8* %this, i32 16
    %_37 = bitcast i8* %_36 to i1*
    %_38 = load i1, i1* %_37
;---IN PRIMARY EXPRESSION END 1838 ---


    br i1 %_38, label %if_then_2, label %if_else_2
    if_then_2:
  ;primary: other
    %_39 = load i8*, i8** %other
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_40 = bitcast i8* %_39 to i8***
    %_41 = load i8**, i8*** %_40
    %_42 = getelementptr i8*, i8** %_41, i32 3
    %_43 = load i8*, i8** %_42
    %_44 = bitcast i8* %_43 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_45 = call i1 %_44(i8* %_39)

  ;primary: %_45
;---IN PRIMARY EXPRESSION END 1850---


    %_46 = xor i1 %_45 , 1
    br i1 %_46, label %if_then_3, label %if_else_3
    if_then_3:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ret_val


    br label %if_end_3
    if_else_3:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_3
    if_end_3:
    br label %if_end_2
    if_else_2:
  ;primary: other
    %_47 = load i8*, i8** %other
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_48 = bitcast i8* %_47 to i8***
    %_49 = load i8**, i8*** %_48
    %_50 = getelementptr i8*, i8** %_49, i32 3
    %_51 = load i8*, i8** %_50
    %_52 = bitcast i8* %_51 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_53 = call i1 %_52(i8* %_47)

    br i1 %_53, label %if_then_4, label %if_else_4
    if_then_4:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ret_val


    br label %if_end_4
    if_else_4:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_4
    if_end_4:
    br label %if_end_2
    if_end_2:
    br label %if_end_1
    if_end_1:
    br label %if_end_0
    if_end_0:
  ;primary: ret_val
    %_54 = load i1, i1* %ret_val
;---IN PRIMARY EXPRESSION END 1846---


    ret i1 %_54
}
define i1 @Element.Compare(i8* %this, i32 %.num1, i32 %.num2){
    %num1 = alloca i32
    store i32 %.num1, i32* %num1
    %num2 = alloca i32
    store i32 %.num2, i32* %num2
    %aux02 = alloca i32
    %retval = alloca i1
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %retval


    ; code snipet for assignment Statemnt
  ;primary: num2
    %_0 = load i32, i32* %num2
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_1 = add i32 1 ,  %_0


    store i32 %_1, i32* %aux02


  ;primary: num1
    %_2 = load i32, i32* %num1
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: num2
    %_3 = load i32, i32* %num2
;---IN PRIMARY EXPRESSION END 1846---


    %_4 = icmp slt i32 %_2 , %_3
    br i1 %_4, label %if_then_0, label %if_else_0
    if_then_0:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %retval


    br label %if_end_0
    if_else_0:
  ;primary: num1
    %_5 = load i32, i32* %num1
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: aux02
    %_6 = load i32, i32* %aux02
;---IN PRIMARY EXPRESSION END 1846---


    %_7 = icmp slt i32 %_5 , %_6
  ;primary: %_7
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = xor i1 %_7 , 1
    br i1 %_8, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %retval


    br label %if_end_1
    if_else_1:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %retval


    br label %if_end_1
    if_end_1:
    br label %if_end_0
    if_end_0:
  ;primary: retval
    %_9 = load i1, i1* %retval
;---IN PRIMARY EXPRESSION END 1846---


    ret i1 %_9
}
define i1 @List.Init(i8* %this){
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    %_0 = getelementptr i8, i8* %this, i32 24
    %_1 = bitcast i8* %_0 to i1*
    store i1 1, i1* %_1


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i1 @List.InitNew(i8* %this, i8* %.v_elem, i8* %.v_next, i1 %.v_end){
    %v_elem = alloca i8*
    store i8* %.v_elem, i8** %v_elem
    %v_next = alloca i8*
    store i8* %.v_next, i8** %v_next
    %v_end = alloca i1
    store i1 %.v_end, i1* %v_end
    ; code snipet for assignment Statemnt
  ;primary: v_end
    %_0 = load i1, i1* %v_end
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 24
    %_2 = bitcast i8* %_1 to i1*
    store i1 %_0, i1* %_2


    ; code snipet for assignment Statemnt
  ;primary: v_elem
    %_3 = load i8*, i8** %v_elem
;---IN PRIMARY EXPRESSION END 1846---


    %_4 = getelementptr i8, i8* %this, i32 8
    %_5 = bitcast i8* %_4 to i8**
    store i8* %_3, i8** %_5


    ; code snipet for assignment Statemnt
  ;primary: v_next
    %_6 = load i8*, i8** %v_next
;---IN PRIMARY EXPRESSION END 1846---


    %_7 = getelementptr i8, i8* %this, i32 16
    %_8 = bitcast i8* %_7 to i8**
    store i8* %_6, i8** %_8


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i8* @List.Insert(i8* %this, i8* %.new_elem){
    %new_elem = alloca i8*
    store i8* %.new_elem, i8** %new_elem
    %aux02 = alloca i8*
    %aux03 = alloca i8*
    %ret_val = alloca i1
    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %aux03


    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 25)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [10 x i8*], [10 x i8*]* @.List_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_0, i8 ** %aux02


    ; code snipet for assignment Statemnt
  ;primary: aux02
    %_3 = load i8*, i8** %aux02
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_4 = bitcast i8* %_3 to i8***
    %_5 = load i8**, i8*** %_4
    %_6 = getelementptr i8*, i8** %_5, i32 1
    %_7 = load i8*, i8** %_6
    %_8 = bitcast i8* %_7 to i1 (i8 *, i8 *, i8 *, i1)*

    ;Code snippet for performing the call 

  ;primary: new_elem
    %_9 = load i8*, i8** %new_elem
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: aux03
    %_10 = load i8*, i8** %aux03
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_11 = call i1 %_8(i8* %_3 , i8* %_9, i8* %_10, i1 0)

    store i1 %_11, i1* %ret_val


  ;primary: aux02
    %_12 = load i8*, i8** %aux02
;---IN PRIMARY EXPRESSION END 1846---


    ret i8* %_12
}
define i1 @List.SetNext(i8* %this, i8* %.v_next){
    %v_next = alloca i8*
    store i8* %.v_next, i8** %v_next
    ; code snipet for assignment Statemnt
  ;primary: v_next
    %_0 = load i8*, i8** %v_next
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 16
    %_2 = bitcast i8* %_1 to i8**
    store i8* %_0, i8** %_2


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i8* @List.Delete(i8* %this, i8* %.e){
    %e = alloca i8*
    store i8* %.e, i8** %e
    %aux01 = alloca i8*
    %aux04 = alloca i32
    %aux05 = alloca i1
    %my_head = alloca i8*
    %nt = alloca i32
    %prev = alloca i8*
    %ret_val = alloca i1
    %var_elem = alloca i8*
    %var_end = alloca i1
    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %my_head


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    store i1 0, i1* %ret_val


    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_0 = sub i32  1 ,  0


    store i32 %_0, i32* %aux04


    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %aux01


    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %prev


    ; code snipet for assignment Statemnt
  ;primary: end
    %_1 = getelementptr i8, i8* %this, i32 24
    %_2 = bitcast i8* %_1 to i1*
    %_3 = load i1, i1* %_2
;---IN PRIMARY EXPRESSION END 1838 ---


    store i1 %_3, i1* %var_end


    ; code snipet for assignment Statemnt
  ;primary: elem
    %_4 = getelementptr i8, i8* %this, i32 8
    %_5 = bitcast i8* %_4 to i8**
    %_6 = load i8*, i8** %_5
;---IN PRIMARY EXPRESSION END 1838 ---


    store i8* %_6, i8** %var_elem



  ;while loop
br label %whileCond_0

whileCond_0:
 ; Check result, short circuit if false
  ;primary: var_end
    %_7 = load i1, i1* %var_end
;---IN PRIMARY EXPRESSION END 1846---


    %_8 = xor i1 %_7 , 1
  ;primary: %_8
;---IN PRIMARY EXPRESSION END 1850---


    br i1 %_8, label %exp_res_11, label %exp_res_1
    exp_res_1:
    br label %exp_res_13

    exp_res_11:
  ;primary: ret_val
    %_9 = load i1, i1* %ret_val
;---IN PRIMARY EXPRESSION END 1846---


    %_10 = xor i1 %_9 , 1
  ;primary: %_10
;---IN PRIMARY EXPRESSION END 1850---


    br label %exp_res_12

   exp_res_12:
    br label %exp_res_13

      exp_res_13:
    %_11 = phi i1  [ 0, %exp_res_1 ], [ %_10, %exp_res_12 ]
br i1%_11, label %loop_then_0, label %loop_exit_0

loop_then_0:
  ;primary: e
    %_12 = load i8*, i8** %e
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_13 = bitcast i8* %_12 to i8***
    %_14 = load i8**, i8*** %_13
    %_15 = getelementptr i8*, i8** %_14, i32 4
    %_16 = load i8*, i8** %_15
    %_17 = bitcast i8* %_16 to i1 (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: var_elem
    %_18 = load i8*, i8** %var_elem
;---IN PRIMARY EXPRESSION END 1846---


    %_19 = call i1 %_17(i8* %_12 , i8* %_18)

    br i1 %_19, label %if_then_5, label %if_else_5
    if_then_5:
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    store i1 1, i1* %ret_val


  ;primary: aux04
    %_20 = load i32, i32* %aux04
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    %_21 = icmp slt i32 %_20 , 0
    br i1 %_21, label %if_then_6, label %if_else_6
    if_then_6:
    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_22 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_23 = bitcast i8* %_22 to i8***
    %_24 = load i8**, i8*** %_23
    %_25 = getelementptr i8*, i8** %_24, i32 8
    %_26 = load i8*, i8** %_25
    %_27 = bitcast i8* %_26 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_28 = call i8* %_27(i8* %_22)

    store i8* %_28, i8** %my_head


    br label %if_end_6
    if_else_6:
    ;code snipet for printing
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 555
;---IN PRIMARY EXPRESSION END 1850---


    %_29 = sub i32  555 ,  0


    call void (i32) @print_int(i32 %_29)
    ; code snipet for assignment Statemnt
  ;primary: prev
    %_30 = load i8*, i8** %prev
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_31 = bitcast i8* %_30 to i8***
    %_32 = load i8**, i8*** %_31
    %_33 = getelementptr i8*, i8** %_32, i32 3
    %_34 = load i8*, i8** %_33
    %_35 = bitcast i8* %_34 to i1 (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: aux01
    %_36 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_37 = bitcast i8* %_36 to i8***
    %_38 = load i8**, i8*** %_37
    %_39 = getelementptr i8*, i8** %_38, i32 8
    %_40 = load i8*, i8** %_39
    %_41 = bitcast i8* %_40 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_42 = call i8* %_41(i8* %_36)

    %_43 = call i1 %_35(i8* %_30 , i8* %_42)

    store i1 %_43, i1* %aux05


    ;code snipet for printing
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 555
;---IN PRIMARY EXPRESSION END 1850---


    %_44 = sub i32  555 ,  0


    call void (i32) @print_int(i32 %_44)
    br label %if_end_6
    if_end_6:
    br label %if_end_5
    if_else_5:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_5
    if_end_5:
  ;primary: ret_val
    %_45 = load i1, i1* %ret_val
;---IN PRIMARY EXPRESSION END 1846---


    %_46 = xor i1 %_45 , 1
    br i1 %_46, label %if_then_7, label %if_else_7
    if_then_7:
    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_47 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_47, i8** %prev


    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_48 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_49 = bitcast i8* %_48 to i8***
    %_50 = load i8**, i8*** %_49
    %_51 = getelementptr i8*, i8** %_50, i32 8
    %_52 = load i8*, i8** %_51
    %_53 = bitcast i8* %_52 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_54 = call i8* %_53(i8* %_48)

    store i8* %_54, i8** %aux01


    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_55 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_56 = bitcast i8* %_55 to i8***
    %_57 = load i8**, i8*** %_56
    %_58 = getelementptr i8*, i8** %_57, i32 6
    %_59 = load i8*, i8** %_58
    %_60 = bitcast i8* %_59 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_61 = call i1 %_60(i8* %_55)

    store i1 %_61, i1* %var_end


    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_62 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_63 = bitcast i8* %_62 to i8***
    %_64 = load i8**, i8*** %_63
    %_65 = getelementptr i8*, i8** %_64, i32 7
    %_66 = load i8*, i8** %_65
    %_67 = bitcast i8* %_66 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_68 = call i8* %_67(i8* %_62)

    store i8* %_68, i8** %var_elem


    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %aux04


    br label %if_end_7
    if_else_7:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_7
    if_end_7:
br label %whileCond_0
loop_exit_0:


  ;primary: my_head
    %_69 = load i8*, i8** %my_head
;---IN PRIMARY EXPRESSION END 1846---


    ret i8* %_69
}
define i32 @List.Search(i8* %this, i8* %.e){
    %e = alloca i8*
    store i8* %.e, i8** %e
    %aux01 = alloca i8*
    %int_ret_val = alloca i32
    %nt = alloca i32
    %var_elem = alloca i8*
    %var_end = alloca i1
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %int_ret_val


    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %aux01


    ; code snipet for assignment Statemnt
  ;primary: end
    %_0 = getelementptr i8, i8* %this, i32 24
    %_1 = bitcast i8* %_0 to i1*
    %_2 = load i1, i1* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    store i1 %_2, i1* %var_end


    ; code snipet for assignment Statemnt
  ;primary: elem
    %_3 = getelementptr i8, i8* %this, i32 8
    %_4 = bitcast i8* %_3 to i8**
    %_5 = load i8*, i8** %_4
;---IN PRIMARY EXPRESSION END 1838 ---


    store i8* %_5, i8** %var_elem



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: var_end
    %_6 = load i1, i1* %var_end
;---IN PRIMARY EXPRESSION END 1846---


    %_7 = xor i1 %_6 , 1
br i1%_7, label %loop_then_0, label %loop_exit_0

loop_then_0:
  ;primary: e
    %_8 = load i8*, i8** %e
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_9 = bitcast i8* %_8 to i8***
    %_10 = load i8**, i8*** %_9
    %_11 = getelementptr i8*, i8** %_10, i32 4
    %_12 = load i8*, i8** %_11
    %_13 = bitcast i8* %_12 to i1 (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: var_elem
    %_14 = load i8*, i8** %var_elem
;---IN PRIMARY EXPRESSION END 1846---


    %_15 = call i1 %_13(i8* %_8 , i8* %_14)

    br i1 %_15, label %if_then_1, label %if_else_1
    if_then_1:
    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %int_ret_val


    br label %if_end_1
    if_else_1:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_1
    if_end_1:
    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_16 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_17 = bitcast i8* %_16 to i8***
    %_18 = load i8**, i8*** %_17
    %_19 = getelementptr i8*, i8** %_18, i32 8
    %_20 = load i8*, i8** %_19
    %_21 = bitcast i8* %_20 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_22 = call i8* %_21(i8* %_16)

    store i8* %_22, i8** %aux01


    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_23 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_24 = bitcast i8* %_23 to i8***
    %_25 = load i8**, i8*** %_24
    %_26 = getelementptr i8*, i8** %_25, i32 6
    %_27 = load i8*, i8** %_26
    %_28 = bitcast i8* %_27 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_29 = call i1 %_28(i8* %_23)

    store i1 %_29, i1* %var_end


    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_30 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_31 = bitcast i8* %_30 to i8***
    %_32 = load i8**, i8*** %_31
    %_33 = getelementptr i8*, i8** %_32, i32 7
    %_34 = load i8*, i8** %_33
    %_35 = bitcast i8* %_34 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_36 = call i8* %_35(i8* %_30)

    store i8* %_36, i8** %var_elem


br label %whileCond_0
loop_exit_0:


  ;primary: int_ret_val
    %_37 = load i32, i32* %int_ret_val
;---IN PRIMARY EXPRESSION END 1846---


    ret i32 %_37
}
define i1 @List.GetEnd(i8* %this){
  ;primary: end
    %_0 = getelementptr i8, i8* %this, i32 24
    %_1 = bitcast i8* %_0 to i1*
    %_2 = load i1, i1* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i1 %_2
}
define i8* @List.GetElem(i8* %this){
  ;primary: elem
    %_0 = getelementptr i8, i8* %this, i32 8
    %_1 = bitcast i8* %_0 to i8**
    %_2 = load i8*, i8** %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i8* %_2
}
define i8* @List.GetNext(i8* %this){
  ;primary: next
    %_0 = getelementptr i8, i8* %this, i32 16
    %_1 = bitcast i8* %_0 to i8**
    %_2 = load i8*, i8** %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    ret i8* %_2
}
define i1 @List.Print(i8* %this){
    %aux01 = alloca i8*
    %var_elem = alloca i8*
    %var_end = alloca i1
    ; code snipet for assignment Statemnt
  ;primary: this
    store i8* %this, i8** %aux01


    ; code snipet for assignment Statemnt
  ;primary: end
    %_0 = getelementptr i8, i8* %this, i32 24
    %_1 = bitcast i8* %_0 to i1*
    %_2 = load i1, i1* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


    store i1 %_2, i1* %var_end


    ; code snipet for assignment Statemnt
  ;primary: elem
    %_3 = getelementptr i8, i8* %this, i32 8
    %_4 = bitcast i8* %_3 to i8**
    %_5 = load i8*, i8** %_4
;---IN PRIMARY EXPRESSION END 1838 ---


    store i8* %_5, i8** %var_elem



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: var_end
    %_6 = load i1, i1* %var_end
;---IN PRIMARY EXPRESSION END 1846---


    %_7 = xor i1 %_6 , 1
br i1%_7, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ;code snipet for printing
  ;primary: var_elem
    %_8 = load i8*, i8** %var_elem
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_9 = bitcast i8* %_8 to i8***
    %_10 = load i8**, i8*** %_9
    %_11 = getelementptr i8*, i8** %_10, i32 1
    %_12 = load i8*, i8** %_11
    %_13 = bitcast i8* %_12 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_14 = call i32 %_13(i8* %_8)

    call void (i32) @print_int(i32 %_14)
    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_15 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_16 = bitcast i8* %_15 to i8***
    %_17 = load i8**, i8*** %_16
    %_18 = getelementptr i8*, i8** %_17, i32 8
    %_19 = load i8*, i8** %_18
    %_20 = bitcast i8* %_19 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_21 = call i8* %_20(i8* %_15)

    store i8* %_21, i8** %aux01


    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_22 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_23 = bitcast i8* %_22 to i8***
    %_24 = load i8**, i8*** %_23
    %_25 = getelementptr i8*, i8** %_24, i32 6
    %_26 = load i8*, i8** %_25
    %_27 = bitcast i8* %_26 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_28 = call i1 %_27(i8* %_22)

    store i1 %_28, i1* %var_end


    ; code snipet for assignment Statemnt
  ;primary: aux01
    %_29 = load i8*, i8** %aux01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_30 = bitcast i8* %_29 to i8***
    %_31 = load i8**, i8*** %_30
    %_32 = getelementptr i8*, i8** %_31, i32 7
    %_33 = load i8*, i8** %_32
    %_34 = bitcast i8* %_33 to i8* (i8 *)*

    ;Code snippet for performing the call 

    %_35 = call i8* %_34(i8* %_29)

    store i8* %_35, i8** %var_elem


br label %whileCond_0
loop_exit_0:


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    ret i1 true
}
define i32 @LL.Start(i8* %this){
    %aux01 = alloca i1
    %el01 = alloca i8*
    %el02 = alloca i8*
    %el03 = alloca i8*
    %head = alloca i8*
    %last_elem = alloca i8*
    ; code snipet for assignment Statemnt
    %_0 = call i8* @calloc(i32 1, i32 25)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [10 x i8*], [10 x i8*]* @.List_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_0, i8 ** %last_elem


    ; code snipet for assignment Statemnt
  ;primary: last_elem
    %_3 = load i8*, i8** %last_elem
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_4 = bitcast i8* %_3 to i8***
    %_5 = load i8**, i8*** %_4
    %_6 = getelementptr i8*, i8** %_5, i32 0
    %_7 = load i8*, i8** %_6
    %_8 = bitcast i8* %_7 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_9 = call i1 %_8(i8* %_3)

    store i1 %_9, i1* %aux01


    ; code snipet for assignment Statemnt
  ;primary: last_elem
    %_10 = load i8*, i8** %last_elem
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_10, i8** %head


    ; code snipet for assignment Statemnt
  ;primary: head
    %_11 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_12 = bitcast i8* %_11 to i8***
    %_13 = load i8**, i8*** %_12
    %_14 = getelementptr i8*, i8** %_13, i32 0
    %_15 = load i8*, i8** %_14
    %_16 = bitcast i8* %_15 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_17 = call i1 %_16(i8* %_11)

    store i1 %_17, i1* %aux01


    ; code snipet for assignment Statemnt
  ;primary: head
    %_18 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_19 = bitcast i8* %_18 to i8***
    %_20 = load i8**, i8*** %_19
    %_21 = getelementptr i8*, i8** %_20, i32 9
    %_22 = load i8*, i8** %_21
    %_23 = bitcast i8* %_22 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_24 = call i1 %_23(i8* %_18)

    store i1 %_24, i1* %aux01


    ; code snipet for assignment Statemnt
    %_25 = call i8* @calloc(i32 1, i32 17)
    %_26 = bitcast i8* %_25 to i8***
    %_27 = getelementptr [6 x i8*], [6 x i8*]* @.Element_vtable, i32 0, i32 0
    store i8** %_27, i8*** %_26


  ;primary: %_25
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_25, i8 ** %el01


    ; code snipet for assignment Statemnt
  ;primary: el01
    %_28 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_29 = bitcast i8* %_28 to i8***
    %_30 = load i8**, i8*** %_29
    %_31 = getelementptr i8*, i8** %_30, i32 0
    %_32 = load i8*, i8** %_31
    %_33 = bitcast i8* %_32 to i1 (i8 *, i32, i32, i1)*

    ;Code snippet for performing the call 

  ;primary: 25
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 37000
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_34 = call i1 %_33(i8* %_28 , i32 25, i32 37000, i1 0)

    store i1 %_34, i1* %aux01


    ; code snipet for assignment Statemnt
  ;primary: head
    %_35 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_36 = bitcast i8* %_35 to i8***
    %_37 = load i8**, i8*** %_36
    %_38 = getelementptr i8*, i8** %_37, i32 2
    %_39 = load i8*, i8** %_38
    %_40 = bitcast i8* %_39 to i8* (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el01
    %_41 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---


    %_42 = call i8* %_40(i8* %_35 , i8* %_41)

    store i8* %_42, i8** %head


    ; code snipet for assignment Statemnt
  ;primary: head
    %_43 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_44 = bitcast i8* %_43 to i8***
    %_45 = load i8**, i8*** %_44
    %_46 = getelementptr i8*, i8** %_45, i32 9
    %_47 = load i8*, i8** %_46
    %_48 = bitcast i8* %_47 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_49 = call i1 %_48(i8* %_43)

    store i1 %_49, i1* %aux01


    ;code snipet for printing
  ;primary: 10000000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 10000000)
    ; code snipet for assignment Statemnt
    %_50 = call i8* @calloc(i32 1, i32 17)
    %_51 = bitcast i8* %_50 to i8***
    %_52 = getelementptr [6 x i8*], [6 x i8*]* @.Element_vtable, i32 0, i32 0
    store i8** %_52, i8*** %_51


  ;primary: %_50
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_50, i8 ** %el01


    ; code snipet for assignment Statemnt
  ;primary: el01
    %_53 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_54 = bitcast i8* %_53 to i8***
    %_55 = load i8**, i8*** %_54
    %_56 = getelementptr i8*, i8** %_55, i32 0
    %_57 = load i8*, i8** %_56
    %_58 = bitcast i8* %_57 to i1 (i8 *, i32, i32, i1)*

    ;Code snippet for performing the call 

  ;primary: 39
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 42000
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    %_59 = call i1 %_58(i8* %_53 , i32 39, i32 42000, i1 1)

    store i1 %_59, i1* %aux01


    ; code snipet for assignment Statemnt
  ;primary: el01
    %_60 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---


    store i8* %_60, i8** %el02


    ; code snipet for assignment Statemnt
  ;primary: head
    %_61 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_62 = bitcast i8* %_61 to i8***
    %_63 = load i8**, i8*** %_62
    %_64 = getelementptr i8*, i8** %_63, i32 2
    %_65 = load i8*, i8** %_64
    %_66 = bitcast i8* %_65 to i8* (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el01
    %_67 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---


    %_68 = call i8* %_66(i8* %_61 , i8* %_67)

    store i8* %_68, i8** %head


    ; code snipet for assignment Statemnt
  ;primary: head
    %_69 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_70 = bitcast i8* %_69 to i8***
    %_71 = load i8**, i8*** %_70
    %_72 = getelementptr i8*, i8** %_71, i32 9
    %_73 = load i8*, i8** %_72
    %_74 = bitcast i8* %_73 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_75 = call i1 %_74(i8* %_69)

    store i1 %_75, i1* %aux01


    ;code snipet for printing
  ;primary: 10000000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 10000000)
    ; code snipet for assignment Statemnt
    %_76 = call i8* @calloc(i32 1, i32 17)
    %_77 = bitcast i8* %_76 to i8***
    %_78 = getelementptr [6 x i8*], [6 x i8*]* @.Element_vtable, i32 0, i32 0
    store i8** %_78, i8*** %_77


  ;primary: %_76
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_76, i8 ** %el01


    ; code snipet for assignment Statemnt
  ;primary: el01
    %_79 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_80 = bitcast i8* %_79 to i8***
    %_81 = load i8**, i8*** %_80
    %_82 = getelementptr i8*, i8** %_81, i32 0
    %_83 = load i8*, i8** %_82
    %_84 = bitcast i8* %_83 to i1 (i8 *, i32, i32, i1)*

    ;Code snippet for performing the call 

  ;primary: 22
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 34000
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_85 = call i1 %_84(i8* %_79 , i32 22, i32 34000, i1 0)

    store i1 %_85, i1* %aux01


    ; code snipet for assignment Statemnt
  ;primary: head
    %_86 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_87 = bitcast i8* %_86 to i8***
    %_88 = load i8**, i8*** %_87
    %_89 = getelementptr i8*, i8** %_88, i32 2
    %_90 = load i8*, i8** %_89
    %_91 = bitcast i8* %_90 to i8* (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el01
    %_92 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---


    %_93 = call i8* %_91(i8* %_86 , i8* %_92)

    store i8* %_93, i8** %head


    ; code snipet for assignment Statemnt
  ;primary: head
    %_94 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_95 = bitcast i8* %_94 to i8***
    %_96 = load i8**, i8*** %_95
    %_97 = getelementptr i8*, i8** %_96, i32 9
    %_98 = load i8*, i8** %_97
    %_99 = bitcast i8* %_98 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_100 = call i1 %_99(i8* %_94)

    store i1 %_100, i1* %aux01


    ; code snipet for assignment Statemnt
    %_101 = call i8* @calloc(i32 1, i32 17)
    %_102 = bitcast i8* %_101 to i8***
    %_103 = getelementptr [6 x i8*], [6 x i8*]* @.Element_vtable, i32 0, i32 0
    store i8** %_103, i8*** %_102


  ;primary: %_101
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_101, i8 ** %el03


    ; code snipet for assignment Statemnt
  ;primary: el03
    %_104 = load i8*, i8** %el03
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_105 = bitcast i8* %_104 to i8***
    %_106 = load i8**, i8*** %_105
    %_107 = getelementptr i8*, i8** %_106, i32 0
    %_108 = load i8*, i8** %_107
    %_109 = bitcast i8* %_108 to i1 (i8 *, i32, i32, i1)*

    ;Code snippet for performing the call 

  ;primary: 27
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 34000
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_110 = call i1 %_109(i8* %_104 , i32 27, i32 34000, i1 0)

    store i1 %_110, i1* %aux01


    ;code snipet for printing
  ;primary: head
    %_111 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_112 = bitcast i8* %_111 to i8***
    %_113 = load i8**, i8*** %_112
    %_114 = getelementptr i8*, i8** %_113, i32 5
    %_115 = load i8*, i8** %_114
    %_116 = bitcast i8* %_115 to i32 (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el02
    %_117 = load i8*, i8** %el02
;---IN PRIMARY EXPRESSION END 1846---


    %_118 = call i32 %_116(i8* %_111 , i8* %_117)

    call void (i32) @print_int(i32 %_118)
    ;code snipet for printing
  ;primary: head
    %_119 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_120 = bitcast i8* %_119 to i8***
    %_121 = load i8**, i8*** %_120
    %_122 = getelementptr i8*, i8** %_121, i32 5
    %_123 = load i8*, i8** %_122
    %_124 = bitcast i8* %_123 to i32 (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el03
    %_125 = load i8*, i8** %el03
;---IN PRIMARY EXPRESSION END 1846---


    %_126 = call i32 %_124(i8* %_119 , i8* %_125)

    call void (i32) @print_int(i32 %_126)
    ;code snipet for printing
  ;primary: 10000000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 10000000)
    ; code snipet for assignment Statemnt
    %_127 = call i8* @calloc(i32 1, i32 17)
    %_128 = bitcast i8* %_127 to i8***
    %_129 = getelementptr [6 x i8*], [6 x i8*]* @.Element_vtable, i32 0, i32 0
    store i8** %_129, i8*** %_128


  ;primary: %_127
;---IN PRIMARY EXPRESSION END 1850---


    store i8 * %_127, i8 ** %el01


    ; code snipet for assignment Statemnt
  ;primary: el01
    %_130 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_131 = bitcast i8* %_130 to i8***
    %_132 = load i8**, i8*** %_131
    %_133 = getelementptr i8*, i8** %_132, i32 0
    %_134 = load i8*, i8** %_133
    %_135 = bitcast i8* %_134 to i1 (i8 *, i32, i32, i1)*

    ;Code snippet for performing the call 

  ;primary: 28
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 35000
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_136 = call i1 %_135(i8* %_130 , i32 28, i32 35000, i1 0)

    store i1 %_136, i1* %aux01


    ; code snipet for assignment Statemnt
  ;primary: head
    %_137 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_138 = bitcast i8* %_137 to i8***
    %_139 = load i8**, i8*** %_138
    %_140 = getelementptr i8*, i8** %_139, i32 2
    %_141 = load i8*, i8** %_140
    %_142 = bitcast i8* %_141 to i8* (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el01
    %_143 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---


    %_144 = call i8* %_142(i8* %_137 , i8* %_143)

    store i8* %_144, i8** %head


    ; code snipet for assignment Statemnt
  ;primary: head
    %_145 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_146 = bitcast i8* %_145 to i8***
    %_147 = load i8**, i8*** %_146
    %_148 = getelementptr i8*, i8** %_147, i32 9
    %_149 = load i8*, i8** %_148
    %_150 = bitcast i8* %_149 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_151 = call i1 %_150(i8* %_145)

    store i1 %_151, i1* %aux01


    ;code snipet for printing
  ;primary: 2220000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 2220000)
    ; code snipet for assignment Statemnt
  ;primary: head
    %_152 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_153 = bitcast i8* %_152 to i8***
    %_154 = load i8**, i8*** %_153
    %_155 = getelementptr i8*, i8** %_154, i32 4
    %_156 = load i8*, i8** %_155
    %_157 = bitcast i8* %_156 to i8* (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el02
    %_158 = load i8*, i8** %el02
;---IN PRIMARY EXPRESSION END 1846---


    %_159 = call i8* %_157(i8* %_152 , i8* %_158)

    store i8* %_159, i8** %head


    ; code snipet for assignment Statemnt
  ;primary: head
    %_160 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_161 = bitcast i8* %_160 to i8***
    %_162 = load i8**, i8*** %_161
    %_163 = getelementptr i8*, i8** %_162, i32 9
    %_164 = load i8*, i8** %_163
    %_165 = bitcast i8* %_164 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_166 = call i1 %_165(i8* %_160)

    store i1 %_166, i1* %aux01


    ;code snipet for printing
  ;primary: 33300000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 33300000)
    ; code snipet for assignment Statemnt
  ;primary: head
    %_167 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_168 = bitcast i8* %_167 to i8***
    %_169 = load i8**, i8*** %_168
    %_170 = getelementptr i8*, i8** %_169, i32 4
    %_171 = load i8*, i8** %_170
    %_172 = bitcast i8* %_171 to i8* (i8 *, i8 *)*

    ;Code snippet for performing the call 

  ;primary: el01
    %_173 = load i8*, i8** %el01
;---IN PRIMARY EXPRESSION END 1846---


    %_174 = call i8* %_172(i8* %_167 , i8* %_173)

    store i8* %_174, i8** %head


    ; code snipet for assignment Statemnt
  ;primary: head
    %_175 = load i8*, i8** %head
;---IN PRIMARY EXPRESSION END 1846---



   ;Code snippet for MessageSend

    %_176 = bitcast i8* %_175 to i8***
    %_177 = load i8**, i8*** %_176
    %_178 = getelementptr i8*, i8** %_177, i32 9
    %_179 = load i8*, i8** %_178
    %_180 = bitcast i8* %_179 to i1 (i8 *)*

    ;Code snippet for performing the call 

    %_181 = call i1 %_180(i8* %_175)

    store i1 %_181, i1* %aux01


    ;code snipet for printing
  ;primary: 44440000
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 44440000)
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
