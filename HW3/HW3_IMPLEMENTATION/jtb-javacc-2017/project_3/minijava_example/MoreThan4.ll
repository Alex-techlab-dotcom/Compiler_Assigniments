

@.MT4_vtable=global[2 x i8*] [
	i8 * bitcast(i32(i8 *, i32, i32, i32, i32, i32, i32) * @MT4.Start to i8 *),
	i8 * bitcast(i32(i8 *, i32, i32, i32, i32, i32, i32) * @MT4.Change to i8 *)
]
@.MoreThan4_vtable=global[0 x i8*] []
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
    %_2 = getelementptr [2 x i8*], [2 x i8*]* @.MT4_vtable, i32 0, i32 0
    store i8** %_2, i8*** %_1


  ;primary: %_0
;---IN PRIMARY EXPRESSION END 1850---



   ;Code snippet for MessageSend

    %_3 = bitcast i8* %_0 to i8***
    %_4 = load i8**, i8*** %_3
    %_5 = getelementptr i8*, i8** %_4, i32 0
    %_6 = load i8*, i8** %_5
    %_7 = bitcast i8* %_6 to i32 (i8 *, i32, i32, i32, i32, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: 1
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 2
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 3
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 4
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 5
;---IN PRIMARY EXPRESSION END 1850---


  ;primary: 6
;---IN PRIMARY EXPRESSION END 1850---


    %_8 = call i32 %_7(i8* %_0 , i32 1, i32 2, i32 3, i32 4, i32 5, i32 6)

    call void (i32) @print_int(i32 %_8)
    ret i32 0
}
define i32 @MT4.Start(i8* %this, i32 %.p1, i32 %.p2, i32 %.p3, i32 %.p4, i32 %.p5, i32 %.p6){
    %p1 = alloca i32
    store i32 %.p1, i32* %p1
    %p2 = alloca i32
    store i32 %.p2, i32* %p2
    %p3 = alloca i32
    store i32 %.p3, i32* %p3
    %p4 = alloca i32
    store i32 %.p4, i32* %p4
    %p5 = alloca i32
    store i32 %.p5, i32* %p5
    %p6 = alloca i32
    store i32 %.p6, i32* %p6
    %aux = alloca i32
    ;code snipet for printing
  ;primary: p1
    %_0 = load i32, i32* %p1
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_0)
    ;code snipet for printing
  ;primary: p2
    %_1 = load i32, i32* %p2
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_1)
    ;code snipet for printing
  ;primary: p3
    %_2 = load i32, i32* %p3
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_2)
    ;code snipet for printing
  ;primary: p4
    %_3 = load i32, i32* %p4
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_3)
    ;code snipet for printing
  ;primary: p5
    %_4 = load i32, i32* %p5
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_4)
    ;code snipet for printing
  ;primary: p6
    %_5 = load i32, i32* %p6
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_5)
    ; code snipet for assignment Statemnt
  ;primary: this

   ;Code snippet for MessageSend

    %_6 = bitcast i8* %this to i8***
    %_7 = load i8**, i8*** %_6
    %_8 = getelementptr i8*, i8** %_7, i32 1
    %_9 = load i8*, i8** %_8
    %_10 = bitcast i8* %_9 to i32 (i8 *, i32, i32, i32, i32, i32, i32)*

    ;Code snippet for performing the call 

  ;primary: p6
    %_11 = load i32, i32* %p6
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: p5
    %_12 = load i32, i32* %p5
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: p4
    %_13 = load i32, i32* %p4
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: p3
    %_14 = load i32, i32* %p3
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: p2
    %_15 = load i32, i32* %p2
;---IN PRIMARY EXPRESSION END 1846---


  ;primary: p1
    %_16 = load i32, i32* %p1
;---IN PRIMARY EXPRESSION END 1846---


    %_17 = call i32 %_10(i8* %this , i32 %_11, i32 %_12, i32 %_13, i32 %_14, i32 %_15, i32 %_16)

    store i32 %_17, i32* %aux


  ;primary: aux
    %_18 = load i32, i32* %aux
;---IN PRIMARY EXPRESSION END 1846---


    ret i32 %_18
}
define i32 @MT4.Change(i8* %this, i32 %.p1, i32 %.p2, i32 %.p3, i32 %.p4, i32 %.p5, i32 %.p6){
    %p1 = alloca i32
    store i32 %.p1, i32* %p1
    %p2 = alloca i32
    store i32 %.p2, i32* %p2
    %p3 = alloca i32
    store i32 %.p3, i32* %p3
    %p4 = alloca i32
    store i32 %.p4, i32* %p4
    %p5 = alloca i32
    store i32 %.p5, i32* %p5
    %p6 = alloca i32
    store i32 %.p6, i32* %p6
    ;code snipet for printing
  ;primary: p1
    %_0 = load i32, i32* %p1
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_0)
    ;code snipet for printing
  ;primary: p2
    %_1 = load i32, i32* %p2
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_1)
    ;code snipet for printing
  ;primary: p3
    %_2 = load i32, i32* %p3
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_2)
    ;code snipet for printing
  ;primary: p4
    %_3 = load i32, i32* %p4
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_3)
    ;code snipet for printing
  ;primary: p5
    %_4 = load i32, i32* %p5
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_4)
    ;code snipet for printing
  ;primary: p6
    %_5 = load i32, i32* %p6
;---IN PRIMARY EXPRESSION END 1846---


    call void (i32) @print_int(i32 %_5)
  ;primary: 0
;---IN PRIMARY EXPRESSION END 1850---


    ret i32 0
}
