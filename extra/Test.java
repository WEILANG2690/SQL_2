/*java main いString[] argsノ猭 
  http://liujinpan75.iteye.com/blog/486664

*String[] args: args琌¨把计〃罽糶эΘヴ種 
                args禞琌㏑把计ノ祘Αい 
*や穿眖㏑块把计 
   String[] args硂﹃皚琌玂笲︽mainㄧ计块把计 ㄒ mainㄧ计┮摸testê或cmd笲︽java test a b c 
   args[0]=a,args[1]=b,args[2]=c,碞祘Αい秸ノ块硂ㄇ跑计 
*/

/*ㄒTest.java */
public class Test
{ 
   public static void main(String[] args)
   { 
     System.out.println("args[0] is "+args[0]); 
     System.out.println("args[1] is "+args[1]); 
     System.out.println("args[2] is "+args[2]); 
   } 
} 

/*
cmdい块祘Α┮惠璶把计 
javac Test.java 
java Test zhang xiao yu 

块挡狦 
args[0] is zhang 
args[1] is xiao 
args[2] is yu 

*/
