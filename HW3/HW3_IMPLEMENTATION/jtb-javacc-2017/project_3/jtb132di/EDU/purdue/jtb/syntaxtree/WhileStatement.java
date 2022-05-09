//
// Generated by JTB 1.3.1
//

package EDU.purdue.jtb.syntaxtree;

/**
 * Grammar production:
 * f0 -> "while"
 * f1 -> "("
 * f2 -> Expression()
 * f3 -> ")"
 * f4 -> Statement()
 */
public class WhileStatement implements Node {
   public NodeToken f0;
   public NodeToken f1;
   public Expression f2;
   public NodeToken f3;
   public Statement f4;

   public WhileStatement(NodeToken n0, NodeToken n1, Expression n2, NodeToken n3, Statement n4) {
      f0 = n0;
      f1 = n1;
      f2 = n2;
      f3 = n3;
      f4 = n4;
   }

   public WhileStatement(Expression n0, Statement n1) {
      f0 = new NodeToken("while");
      f1 = new NodeToken("(");
      f2 = n0;
      f3 = new NodeToken(")");
      f4 = n1;
   }

   public void accept(EDU.purdue.jtb.visitor.Visitor v) {
      v.visit(this);
   }
   public <R,A> R accept(EDU.purdue.jtb.visitor.GJVisitor<R,A> v, A argu) {
      return v.visit(this,argu);
   }
   public <R> R accept(EDU.purdue.jtb.visitor.GJNoArguVisitor<R> v) {
      return v.visit(this);
   }
   public <A> void accept(EDU.purdue.jtb.visitor.GJVoidVisitor<A> v, A argu) {
      v.visit(this,argu);
   }
}
