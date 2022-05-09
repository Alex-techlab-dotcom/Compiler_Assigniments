

@.BBS_vtable=global[4 x i8*] [
	i8 * bitcast(i32(i8 *, i32) * @BBS.Start to i8 *),
	i8 * bitcast(i32(i8 *) * @BBS.Sort to i8 *),
	i8 * bitcast(i32(i8 *) * @BBS.Print to i8 *),
	i8 * bitcast(i32(i8 *, i32) * @BBS.Init to i8 *)
]
@.BubbleSort_vtable=global[0 x i8*] []
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
    %_0 = call i8* @calloc(i32 1, i32 20)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [4 x i8*], [4 x i8*]* @.BBS_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: 10
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = call i32 %_7(i8* %_0 , i32 10)

    call void (i32) @print_int(i32 %_8)
    ret i32 0
}
define i32 @BBS.Start(i8* %this, i32 %.sz){
    %sz = alloca i32
    store i32 %.sz, i32* %sz
    %aux01 = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_0 = bitcast i8* %this to i8***
    %_1 = load i8**, i8*** %_0
    %_2 = getelementptr i8*, i8** %_1, i32 3
    %_3 = load i8*, i8** %_2
    %_4 = bitcast i8* %_3 to i32 (i8 *, i32)*

    ;Code snippet for performing the call 

  ;primary: sz
    %_5 = load i32, i32* %sz
;---IN PRIMARY EXPRESSION END 1846---


    %_6 = call i32 %_4(i8* %this , i32 %_5)

    store i32 %_6, i32* %aux01


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_7 = bitcast i8* %this to i8***
    %_8 = load i8**, i8*** %_7
    %_9 = getelementptr i8*, i8** %_8, i32 2
    %_10 = load i8*, i8** %_9
    %_11 = bitcast i8* %_10 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_12 = call i32 %_11(i8* %this)

    store i32 %_12, i32* %aux01


    ;code snipet for printing
  ;primary: 99999
;---IN PRIMARY EXPRESSION END 1850---


    call void (i32) @print_int(i32 99999)
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_13 = bitcast i8* %this to i8***
    %_14 = load i8**, i8*** %_13
    %_15 = getelementptr i8*, i8** %_14, i32 1
    %_16 = load i8*, i8** %_15
    %_17 = bitcast i8* %_16 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_18 = call i32 %_17(i8* %this)

    store i32 %_18, i32* %aux01


    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_19 = bitcast i8* %this to i8***
    %_20 = load i8**, i8*** %_19
    %_21 = getelementptr i8*, i8** %_20, i32 2
    %_22 = load i8*, i8** %_21
    %_23 = bitcast i8* %_22 to i32 (i8 *)*

    ;Code snippet for performing the call 

    %_24 = call i32 %_23(i8* %this)

    store i32 %_24, i32* %aux01


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @BBS.Sort(i8* %this){
    %aux02 = alloca i32
    %aux04 = alloca i32
    %aux05 = alloca i32
    %aux06 = alloca i32
    %aux07 = alloca i32
    %i = alloca i32
    %j = alloca i32
    %nt = alloca i32
    %t = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: size
    %_0 = getelementptr i8, i8* %this, i32 16
    %_1 = bitcast i8* %_0 to i32*
    %_2 = load i32, i32* %_1
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_3 = sub i32  1 ,  %_2


    store i32 %_3, i32* %i


    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_4 = sub i32  1 ,  0


    store i32 %_4, i32* %aux02



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: aux02
    %_5 = load i32, i32* %aux02
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_6 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


    %_7 = icmp slt i32 %_5 , %_6
br i1%_7, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ; code snipet for assignment Statemnt
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    store i32 1, i32* %j



  ;while loop
br label %whileCond_1

whileCond_1:
  ;primary: j
    %_8 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: i
    %_9 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_10 = add i32 1 ,  %_9


  ;primary: %_10
;---IN PRIMARY EXPRESSION END 1850---


    %_11 = icmp slt i32 %_8 , %_10
br i1%_11, label %loop_then_1, label %loop_exit_1

loop_then_1:
    ; code snipet for assignment Statemnt
  ;primary: j
    %_12 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_13 = sub i32  1 ,  %_12


    store i32 %_13, i32* %aux07


    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: number
    %_14 = getelementptr i8, i8* %this, i32 8
    %_15 = bitcast i8* %_14 to i32**
    %_16 = load i32*, i32** %_15
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: aux07
    %_17 = load i32, i32* %aux07
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_18 = load i32, i32* %_16
     ; Check that the index is greater than zero
    %_19 = icmp sge i32 %_17 ,0
    ;Chech that the index is less than the size of the array
    %_20 = icmp slt i32 %_17,  %_18
    %_21 = and i1 %_20, %_19
    br i1 %_21, label %oob_ok_2, label %oob_err_2
    ; Else throw out of bounds exception
    oob_err_2:
    call void @throw_oob()
    br label %oob_ok_2
    ; All ok, we can safely index the array now
    oob_ok_2:
    %_22 = add i32 1, %_17
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_23 = getelementptr i32, i32* %_16 , i32 %_22
 %_24 = load i32, i32* %_23


    store i32 %_24, i32* %aux04


    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: number
    %_25 = getelementptr i8, i8* %this, i32 8
    %_26 = bitcast i8* %_25 to i32**
    %_27 = load i32*, i32** %_26
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: j
    %_28 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_29 = load i32, i32* %_27
     ; Check that the index is greater than zero
    %_30 = icmp sge i32 %_28 ,0
    ;Chech that the index is less than the size of the array
    %_31 = icmp slt i32 %_28,  %_29
    %_32 = and i1 %_31, %_30
    br i1 %_32, label %oob_ok_3, label %oob_err_3
    ; Else throw out of bounds exception
    oob_err_3:
    call void @throw_oob()
    br label %oob_ok_3
    ; All ok, we can safely index the array now
    oob_ok_3:
    %_33 = add i32 1, %_28
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_34 = getelementptr i32, i32* %_27 , i32 %_33
 %_35 = load i32, i32* %_34


    store i32 %_35, i32* %aux05


  ;primary: aux05
    %_36 = load i32, i32* %aux05
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: aux04
    %_37 = load i32, i32* %aux04
;---IN PRIMARY EXPRESSION END 1846---


    %_38 = icmp slt i32 %_36 , %_37
    br i1 %_38, label %if_then_4, label %if_else_4
    if_then_4:
    ; code snipet for assignment Statemnt
  ;primary: j
    %_39 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_40 = sub i32  1 ,  %_39


    store i32 %_40, i32* %aux06


    ; code snipet for assignment Statemnt
    ;code snipet for arrayLookup
  ;primary: number
    %_41 = getelementptr i8, i8* %this, i32 8
    %_42 = bitcast i8* %_41 to i32**
    %_43 = load i32*, i32** %_42
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: aux06
    %_44 = load i32, i32* %aux06
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_45 = load i32, i32* %_43
     ; Check that the index is greater than zero
    %_46 = icmp sge i32 %_44 ,0
    ;Chech that the index is less than the size of the array
    %_47 = icmp slt i32 %_44,  %_45
    %_48 = and i1 %_47, %_46
    br i1 %_48, label %oob_ok_5, label %oob_err_5
    ; Else throw out of bounds exception
    oob_err_5:
    call void @throw_oob()
    br label %oob_ok_5
    ; All ok, we can safely index the array now
    oob_ok_5:
    %_49 = add i32 1, %_44
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_50 = getelementptr i32, i32* %_43 , i32 %_49
 %_51 = load i32, i32* %_50


    store i32 %_51, i32* %t


    ;code snipet for ArrayAssignmentStatement
    %_52 = getelementptr i8, i8* %this, i32 8
    %_53 = bitcast i8* %_52 to i32**
  ;primary: aux06
    %_54 = load i32, i32* %aux06
;---IN PRIMARY EXPRESSION END 1846---


    ;code snipet for arrayLookup
  ;primary: number
    %_55 = getelementptr i8, i8* %this, i32 8
    %_56 = bitcast i8* %_55 to i32**
    %_57 = load i32*, i32** %_56
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: j
    %_58 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_59 = load i32, i32* %_57
     ; Check that the index is greater than zero
    %_60 = icmp sge i32 %_58 ,0
    ;Chech that the index is less than the size of the array
    %_61 = icmp slt i32 %_58,  %_59
    %_62 = and i1 %_61, %_60
    br i1 %_62, label %oob_ok_6, label %oob_err_6
    ; Else throw out of bounds exception
    oob_err_6:
    call void @throw_oob()
    br label %oob_ok_6
    ; All ok, we can safely index the array now
    oob_ok_6:
    %_63 = add i32 1, %_58
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_64 = getelementptr i32, i32* %_57 , i32 %_63
 %_65 = load i32, i32* %_64


    ;Load the address of the %_53 array
    %_66 = load i32*, i32** %_53
    ; Load the size of the array (first integer of the array)
    %_67 = load i32, i32* %_66
     ; Check that the index is greater than zero
    %_68 = icmp sge i32 %_54 ,0
    ;Chech that the index is less than the size of the array
    %_69 = icmp slt i32 %_54,  %_67
    %_70 = and i1 %_69, %_68
    br i1 %_70, label %oob_ok_7, label %oob_err_7
    ; Else throw out of bounds exception
    oob_err_7:
    call void @throw_oob()
    br label %oob_ok_7
    ; All ok, we can safely index the array now
    oob_ok_7:
    %_71 = add i32 1, %_54
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_72 = getelementptr i32, i32* %_66 , i32 %_71
     ; And store value to that address *%_66 = value
    store i32 %_65, i32* %_72


    ;code snipet for ArrayAssignmentStatement
    %_73 = getelementptr i8, i8* %this, i32 8
    %_74 = bitcast i8* %_73 to i32**
  ;primary: j
    %_75 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: t
    %_76 = load i32, i32* %t
;---IN PRIMARY EXPRESSION END 1846---


    ;Load the address of the %_74 array
    %_77 = load i32*, i32** %_74
    ; Load the size of the array (first integer of the array)
    %_78 = load i32, i32* %_77
     ; Check that the index is greater than zero
    %_79 = icmp sge i32 %_75 ,0
    ;Chech that the index is less than the size of the array
    %_80 = icmp slt i32 %_75,  %_78
    %_81 = and i1 %_80, %_79
    br i1 %_81, label %oob_ok_8, label %oob_err_8
    ; Else throw out of bounds exception
    oob_err_8:
    call void @throw_oob()
    br label %oob_ok_8
    ; All ok, we can safely index the array now
    oob_ok_8:
    %_82 = add i32 1, %_75
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_83 = getelementptr i32, i32* %_77 , i32 %_82
     ; And store value to that address *%_77 = value
    store i32 %_76, i32* %_83


    br label %if_end_4
    if_else_4:
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %nt


    br label %if_end_4
    if_end_4:
    ; code snipet for assignment Statemnt
  ;primary: j
    %_84 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_85 = add i32 1 ,  %_84


    store i32 %_85, i32* %j


br label %whileCond_1
loop_exit_1:


    ; code snipet for assignment Statemnt
  ;primary: i
    %_86 = load i32, i32* %i
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_87 = sub i32  1 ,  %_86


    store i32 %_87, i32* %i


br label %whileCond_0
loop_exit_0:


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @BBS.Print(i8* %this){
    %j = alloca i32
    ; code snipet for assignment Statemnt
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    store i32 0, i32* %j



  ;while loop
br label %whileCond_0

whileCond_0:
  ;primary: j
    %_0 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: size
    %_1 = getelementptr i8, i8* %this, i32 16
    %_2 = bitcast i8* %_1 to i32*
    %_3 = load i32, i32* %_2
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: %_3
;---IN PRIMARY EXPRESSION END 1850---


    %_4 = icmp slt i32 %_0 , %_3
br i1%_4, label %loop_then_0, label %loop_exit_0

loop_then_0:
    ;code snipet for printing
    ;code snipet for arrayLookup
  ;primary: number
    %_5 = getelementptr i8, i8* %this, i32 8
    %_6 = bitcast i8* %_5 to i32**
    %_7 = load i32*, i32** %_6
;---IN PRIMARY EXPRESSION END 1838 ---


  ;primary: j
    %_8 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


    ; Load the size of the array (first integer of the array)
    %_9 = load i32, i32* %_7
     ; Check that the index is greater than zero
    %_10 = icmp sge i32 %_8 ,0
    ;Chech that the index is less than the size of the array
    %_11 = icmp slt i32 %_8,  %_9
    %_12 = and i1 %_11, %_10
    br i1 %_12, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_13 = add i32 1, %_8
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_14 = getelementptr i32, i32* %_7 , i32 %_13
 %_15 = load i32, i32* %_14


    call void (i32) @print_int(i32 %_15)
    ; code snipet for assignment Statemnt
  ;primary: j
    %_16 = load i32, i32* %j
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


    %_17 = add i32 1 ,  %_16


    store i32 %_17, i32* %j


br label %whileCond_0
loop_exit_0:


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
define i32 @BBS.Init(i8* %this, i32 %.sz){
    %sz = alloca i32
    store i32 %.sz, i32* %sz
    ; code snipet for assignment Statemnt
  ;primary: sz
    %_0 = load i32, i32* %sz
;---IN PRIMARY EXPRESSION END 1846---


    %_1 = getelementptr i8, i8* %this, i32 16
    %_2 = bitcast i8* %_1 to i32*
    store i32 %_0, i32* %_2


    ; code snipet for assignment Statemnt
    ; code snipet for array allocation! 
  ;primary: sz
    %_3 = load i32, i32* %sz
;---IN PRIMARY EXPRESSION END 1846---


    %_4 = add i32 1 , %_3
    ; Check that the size of the array is not negative - since we added 1, we just check
    ; that the size is >= 1.
    %_5 = icmp sge i32 %_4 , 1
    br i1 %_5 , label %sizeIsNotNeg_0, label %sizeIsNeg_0
    ; Size was negative, throw negative size exception
    sizeIsNeg_0:
    call void @throw_nsz()
    br label %sizeIsNotNeg_0
    ; All ok, we can proceed with the allocation
    sizeIsNotNeg_0:
    ; Allocate sz + 1 integers (4 bytes each)
    %_6 = call i8* @calloc( i32 %_4, i32 4)
    ; Cast the returned pointer
    %_7 = bitcast i8* %_6 to i32*
    ; Store the size of the array in the first position of the array
    store i32 %_3, i32* %_7


  ;primary: %_7
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = getelementptr i8, i8* %this, i32 8
    %_9 = bitcast i8* %_8 to i32**
    store i32* %_7, i32** %_9


    ;code snipet for ArrayAssignmentStatement
    %_10 = getelementptr i8, i8* %this, i32 8
    %_11 = bitcast i8* %_10 to i32**
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 20
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_11 array
    %_12 = load i32*, i32** %_11
    ; Load the size of the array (first integer of the array)
    %_13 = load i32, i32* %_12
     ; Check that the index is greater than zero
    %_14 = icmp sge i32 0 ,0
    ;Chech that the index is less than the size of the array
    %_15 = icmp slt i32 0,  %_13
    %_16 = and i1 %_15, %_14
    br i1 %_16, label %oob_ok_0, label %oob_err_0
    ; Else throw out of bounds exception
    oob_err_0:
    call void @throw_oob()
    br label %oob_ok_0
    ; All ok, we can safely index the array now
    oob_ok_0:
    %_17 = add i32 1, 0
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_18 = getelementptr i32, i32* %_12 , i32 %_17
     ; And store value to that address *%_12 = value
    store i32 20, i32* %_18


    ;code snipet for ArrayAssignmentStatement
    %_19 = getelementptr i8, i8* %this, i32 8
    %_20 = bitcast i8* %_19 to i32**
  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 7
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_20 array
    %_21 = load i32*, i32** %_20
    ; Load the size of the array (first integer of the array)
    %_22 = load i32, i32* %_21
     ; Check that the index is greater than zero
    %_23 = icmp sge i32 1 ,0
    ;Chech that the index is less than the size of the array
    %_24 = icmp slt i32 1,  %_22
    %_25 = and i1 %_24, %_23
    br i1 %_25, label %oob_ok_1, label %oob_err_1
    ; Else throw out of bounds exception
    oob_err_1:
    call void @throw_oob()
    br label %oob_ok_1
    ; All ok, we can safely index the array now
    oob_ok_1:
    %_26 = add i32 1, 1
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_27 = getelementptr i32, i32* %_21 , i32 %_26
     ; And store value to that address *%_21 = value
    store i32 7, i32* %_27


    ;code snipet for ArrayAssignmentStatement
    %_28 = getelementptr i8, i8* %this, i32 8
    %_29 = bitcast i8* %_28 to i32**
  ;primary: 2
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 12
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_29 array
    %_30 = load i32*, i32** %_29
    ; Load the size of the array (first integer of the array)
    %_31 = load i32, i32* %_30
     ; Check that the index is greater than zero
    %_32 = icmp sge i32 2 ,0
    ;Chech that the index is less than the size of the array
    %_33 = icmp slt i32 2,  %_31
    %_34 = and i1 %_33, %_32
    br i1 %_34, label %oob_ok_2, label %oob_err_2
    ; Else throw out of bounds exception
    oob_err_2:
    call void @throw_oob()
    br label %oob_ok_2
    ; All ok, we can safely index the array now
    oob_ok_2:
    %_35 = add i32 1, 2
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_36 = getelementptr i32, i32* %_30 , i32 %_35
     ; And store value to that address *%_30 = value
    store i32 12, i32* %_36


    ;code snipet for ArrayAssignmentStatement
    %_37 = getelementptr i8, i8* %this, i32 8
    %_38 = bitcast i8* %_37 to i32**
  ;primary: 3
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 18
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_38 array
    %_39 = load i32*, i32** %_38
    ; Load the size of the array (first integer of the array)
    %_40 = load i32, i32* %_39
     ; Check that the index is greater than zero
    %_41 = icmp sge i32 3 ,0
    ;Chech that the index is less than the size of the array
    %_42 = icmp slt i32 3,  %_40
    %_43 = and i1 %_42, %_41
    br i1 %_43, label %oob_ok_3, label %oob_err_3
    ; Else throw out of bounds exception
    oob_err_3:
    call void @throw_oob()
    br label %oob_ok_3
    ; All ok, we can safely index the array now
    oob_ok_3:
    %_44 = add i32 1, 3
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_45 = getelementptr i32, i32* %_39 , i32 %_44
     ; And store value to that address *%_39 = value
    store i32 18, i32* %_45


    ;code snipet for ArrayAssignmentStatement
    %_46 = getelementptr i8, i8* %this, i32 8
    %_47 = bitcast i8* %_46 to i32**
  ;primary: 4
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 2
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_47 array
    %_48 = load i32*, i32** %_47
    ; Load the size of the array (first integer of the array)
    %_49 = load i32, i32* %_48
     ; Check that the index is greater than zero
    %_50 = icmp sge i32 4 ,0
    ;Chech that the index is less than the size of the array
    %_51 = icmp slt i32 4,  %_49
    %_52 = and i1 %_51, %_50
    br i1 %_52, label %oob_ok_4, label %oob_err_4
    ; Else throw out of bounds exception
    oob_err_4:
    call void @throw_oob()
    br label %oob_ok_4
    ; All ok, we can safely index the array now
    oob_ok_4:
    %_53 = add i32 1, 4
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_54 = getelementptr i32, i32* %_48 , i32 %_53
     ; And store value to that address *%_48 = value
    store i32 2, i32* %_54


    ;code snipet for ArrayAssignmentStatement
    %_55 = getelementptr i8, i8* %this, i32 8
    %_56 = bitcast i8* %_55 to i32**
  ;primary: 5
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 11
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_56 array
    %_57 = load i32*, i32** %_56
    ; Load the size of the array (first integer of the array)
    %_58 = load i32, i32* %_57
     ; Check that the index is greater than zero
    %_59 = icmp sge i32 5 ,0
    ;Chech that the index is less than the size of the array
    %_60 = icmp slt i32 5,  %_58
    %_61 = and i1 %_60, %_59
    br i1 %_61, label %oob_ok_5, label %oob_err_5
    ; Else throw out of bounds exception
    oob_err_5:
    call void @throw_oob()
    br label %oob_ok_5
    ; All ok, we can safely index the array now
    oob_ok_5:
    %_62 = add i32 1, 5
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_63 = getelementptr i32, i32* %_57 , i32 %_62
     ; And store value to that address *%_57 = value
    store i32 11, i32* %_63


    ;code snipet for ArrayAssignmentStatement
    %_64 = getelementptr i8, i8* %this, i32 8
    %_65 = bitcast i8* %_64 to i32**
  ;primary: 6
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 6
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_65 array
    %_66 = load i32*, i32** %_65
    ; Load the size of the array (first integer of the array)
    %_67 = load i32, i32* %_66
     ; Check that the index is greater than zero
    %_68 = icmp sge i32 6 ,0
    ;Chech that the index is less than the size of the array
    %_69 = icmp slt i32 6,  %_67
    %_70 = and i1 %_69, %_68
    br i1 %_70, label %oob_ok_6, label %oob_err_6
    ; Else throw out of bounds exception
    oob_err_6:
    call void @throw_oob()
    br label %oob_ok_6
    ; All ok, we can safely index the array now
    oob_ok_6:
    %_71 = add i32 1, 6
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_72 = getelementptr i32, i32* %_66 , i32 %_71
     ; And store value to that address *%_66 = value
    store i32 6, i32* %_72


    ;code snipet for ArrayAssignmentStatement
    %_73 = getelementptr i8, i8* %this, i32 8
    %_74 = bitcast i8* %_73 to i32**
  ;primary: 7
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 9
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_74 array
    %_75 = load i32*, i32** %_74
    ; Load the size of the array (first integer of the array)
    %_76 = load i32, i32* %_75
     ; Check that the index is greater than zero
    %_77 = icmp sge i32 7 ,0
    ;Chech that the index is less than the size of the array
    %_78 = icmp slt i32 7,  %_76
    %_79 = and i1 %_78, %_77
    br i1 %_79, label %oob_ok_7, label %oob_err_7
    ; Else throw out of bounds exception
    oob_err_7:
    call void @throw_oob()
    br label %oob_ok_7
    ; All ok, we can safely index the array now
    oob_ok_7:
    %_80 = add i32 1, 7
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_81 = getelementptr i32, i32* %_75 , i32 %_80
     ; And store value to that address *%_75 = value
    store i32 9, i32* %_81


    ;code snipet for ArrayAssignmentStatement
    %_82 = getelementptr i8, i8* %this, i32 8
    %_83 = bitcast i8* %_82 to i32**
  ;primary: 8
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 19
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_83 array
    %_84 = load i32*, i32** %_83
    ; Load the size of the array (first integer of the array)
    %_85 = load i32, i32* %_84
     ; Check that the index is greater than zero
    %_86 = icmp sge i32 8 ,0
    ;Chech that the index is less than the size of the array
    %_87 = icmp slt i32 8,  %_85
    %_88 = and i1 %_87, %_86
    br i1 %_88, label %oob_ok_8, label %oob_err_8
    ; Else throw out of bounds exception
    oob_err_8:
    call void @throw_oob()
    br label %oob_ok_8
    ; All ok, we can safely index the array now
    oob_ok_8:
    %_89 = add i32 1, 8
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_90 = getelementptr i32, i32* %_84 , i32 %_89
     ; And store value to that address *%_84 = value
    store i32 19, i32* %_90


    ;code snipet for ArrayAssignmentStatement
    %_91 = getelementptr i8, i8* %this, i32 8
    %_92 = bitcast i8* %_91 to i32**
  ;primary: 9
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 5
;---IN PRIMARY EXPRESSION END 1850---


    ;Load the address of the %_92 array
    %_93 = load i32*, i32** %_92
    ; Load the size of the array (first integer of the array)
    %_94 = load i32, i32* %_93
     ; Check that the index is greater than zero
    %_95 = icmp sge i32 9 ,0
    ;Chech that the index is less than the size of the array
    %_96 = icmp slt i32 9,  %_94
    %_97 = and i1 %_96, %_95
    br i1 %_97, label %oob_ok_9, label %oob_err_9
    ; Else throw out of bounds exception
    oob_err_9:
    call void @throw_oob()
    br label %oob_ok_9
    ; All ok, we can safely index the array now
    oob_ok_9:
    %_98 = add i32 1, 9
    ; Get pointer to the i + 1 element of the array (x + i + 1)
    %_99 = getelementptr i32, i32* %_93 , i32 %_98
     ; And store value to that address *%_93 = value
    store i32 5, i32* %_99


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
