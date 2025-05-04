package llua;

import haxe.macro.Expr;

class Macro {

	public static macro function loopTable(l:Expr, v:Expr, body:Expr) {
		return macro {
			Lua.pushnil($l);
			var popped = true;
			while(Lua.next($l, $v < 0 ? $v - 1 : $v) != 0) {
				popped = false;
				$body;
				popped = true;
				Lua.pop($l, 1);
			}
			if(!popped) Lua.pop($l, 1);
		}
	}
}
