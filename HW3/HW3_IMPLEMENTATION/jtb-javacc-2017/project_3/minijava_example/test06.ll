

@.Operator_vtable=global[1 x i8*] [
	i8 * bitcast(i32(i8 *) * @Operator.compute to i8 *)
]
@.test06_vtable=global[0 x i8*] []
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
    %_0 = call i8* @calloc(i32 1, i32 19)
    %_1 = bitcast i8* %_0 to i8***
    %_2 = getelementptr [1 x i8*], [1 x i8*]* @.Operator_vtable, i32 0, i32 0
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
define i32 @Operator.compute(i8* %this){
    ; code snipet for assignment Statemnt
  ;primary: true
;---IN PRIMARY EXPRESSION END 1850---


    %_0 = getelementptr i8, i8* %this, i32 8
    %_1 = bitcast i8* %_0 to i1*
    store i1 1, i1* %_1


    ; code snipet for assignment Statemnt
  ;primary: false
;---IN PRIMARY EXPRESSION END 1850---


    %_2 = getelementptr i8, i8* %this, i32 9
    %_3 = bitcast i8* %_2 to i1*
    store i1 0, i1* %_3


    ; code snipet for assignment Statemnt
 ; Check result, short circuit if false
  ;primary: op1bool
    %_4 = getelementptr i8, i8* %this, i32 8
    %_5 = bitcast i8* %_4 to i1*
    %_6 = load i1, i1* %_5
;---IN PRIMARY EXPRESSION END 1838 ---


    br i1 %_6, label %exp_res_01, label %exp_res_0
    exp_res_0:
    br label %exp_res_03

    exp_res_01:
  ;primary: op2bool
    %_7 = getelementptr i8, i8* %this, i32 9
    %_8 = bitcast i8* %_7 to i1*
    %_9 = load i1, i1* %_8
;---IN PRIMARY EXPRESSION END 1838 ---


    br label %exp_res_02

   exp_res_02:
    br label %exp_res_03

      exp_res_03:
    %_10 = phi i1  [ 0, %exp_res_0 ], [ %_9, %exp_res_02 ]
    %_11 = getelementptr i8, i8* %this, i32 18
    %_12 = bitcast i8* %_11 to i1*
    store i1 %_10, i1* %_12


  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
