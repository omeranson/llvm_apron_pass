; ModuleID = 'simple-O3-mergereturn-named.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [15 x i8] c"USAGE: %s <y>\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define i32 @f(i32 %y) #0 {
entry:
  %cmp = icmp slt i32 %y, 0
  %sub = sub nsw i32 0, %y
  %x.0 = select i1 %cmp, i32 %sub, i32 5
  ret i32 %x.0
}

; Function Attrs: nounwind readnone uwtable
define i32 @f2(i32 %y, i32 %z) #0 {
entry:
  %sub = sub i32 1, %y
  %sub1 = sub i32 %sub, %z
  ret i32 %sub1
}

; Function Attrs: nounwind readnone uwtable
define i32 @f3(i32 %y) #0 {
entry:
  %cmp = icmp sgt i32 %y, 100
  br i1 %cmp, label %return, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp15 = icmp sgt i32 %y, 1
  br i1 %cmp15, label %for.body.lr.ph, label %return

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %tmp = shl i32 %y, 1
  %tmp1 = add i32 %y, -2
  %tmp2 = zext i32 %tmp1 to i33
  %tmp3 = add i32 %y, -3
  %tmp4 = zext i32 %tmp3 to i33
  %tmp5 = mul i33 %tmp2, %tmp4
  %tmp6 = lshr i33 %tmp5, 1
  %tmp7 = trunc i33 %tmp6 to i32
  %tmp8 = add i32 %tmp, %tmp7
  %tmp9 = add i32 %tmp8, -3
  br label %return

return:                                           ; preds = %for.body.lr.ph, %for.cond.preheader, %entry
  %retval.0 = phi i32 [ -1, %entry ], [ %tmp9, %for.body.lr.ph ], [ 0, %for.cond.preheader ]
  ret i32 %retval.0
}

; Function Attrs: nounwind readnone uwtable
define i32 @f4(i32 %y) #0 {
entry:
  %cmp = icmp slt i32 %y, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %add = sub i32 7, %y
  br label %if.end

if.else:                                          ; preds = %entry
  %sub1 = add nsw i32 %y, -3
  %sub2 = sub nsw i32 0, %y
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %z.0 = phi i32 [ %add, %if.then ], [ %sub1, %if.else ]
  %x.0 = phi i32 [ %y, %if.then ], [ %sub2, %if.else ]
  %add3 = add nsw i32 %x.0, %z.0
  ret i32 %add3
}

; Function Attrs: nounwind readnone uwtable
define i32 @f5(i32 %y) #0 {
entry:
  %cmp = icmp sgt i32 %y, -1
  br i1 %cmp, label %return, label %if.else

if.else:                                          ; preds = %entry
  %cond = icmp eq i32 %y, -3
  %sub = sub nsw i32 0, %y
  %.sub = select i1 %cond, i32 4, i32 %sub
  br label %UnifiedReturnBlock

return:                                           ; preds = %entry
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %return, %if.else
  %UnifiedRetVal = phi i32 [ %.sub, %if.else ], [ %y, %return ]
  ret i32 %UnifiedRetVal
}

; Function Attrs: nounwind readnone uwtable
define i32 @f6(i32 %y) #0 {
entry:
  %cmp = icmp slt i32 %y, 0
  br i1 %cmp, label %if.end3, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp sgt i32 %y, 0
  %. = zext i1 %cmp1 to i32
  br label %UnifiedReturnBlock

if.end3:                                          ; preds = %entry
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %if.end3, %if.else
  %UnifiedRetVal = phi i32 [ %., %if.else ], [ -1, %if.end3 ]
  ret i32 %UnifiedRetVal
}

; Function Attrs: nounwind uwtable
define i32 @f7(i32 %y) #1 {
entry:
  %cmp = icmp sgt i32 %y, 30
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i32 (i32, ...)* bitcast (i32 (...)* @h to i32 (i32, ...)*)(i32 %y) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %y.addr.0 = phi i32 [ 30, %if.then ], [ %y, %entry ]
  %call1 = tail call i32 (i32, ...)* bitcast (i32 (...)* @g to i32 (i32, ...)*)(i32 %y.addr.0) #5
  ret i32 %y.addr.0
}

declare i32 @h(...) #2

declare i32 @g(...) #2

; Function Attrs: nounwind readnone uwtable
define i32 @f8(i32 %y, i32 %z) #0 {
entry:
  %cmp = icmp sgt i32 %y, 30
  %z.y = select i1 %cmp, i32 %z, i32 %y
  ret i32 %z.y
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  %cmp = icmp eq i32 %argc, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %tmp = load %struct._IO_FILE** @stderr, align 8
  %tmp1 = load i8** %argv, align 8
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %tmp, i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i8* %tmp1) #6
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8** %argv, i64 1
  %tmp2 = load i8** %arrayidx1, align 8
  %call2 = tail call i32 @atoi(i8* %tmp2) #7
  %cmp.i = icmp slt i32 %call2, 0
  %sub.i = sub nsw i32 0, %call2
  %x.0.i = select i1 %cmp.i, i32 %sub.i, i32 5
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %x.0.i) #5
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) #4

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
