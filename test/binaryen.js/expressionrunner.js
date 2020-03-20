binaryen.setAPITracing(true);

var module = new binaryen.Module();
module.addGlobal("aGlobal", binaryen.i32, true, module.i32.const(0));
var Intent = binaryen.ExpressionRunner.Intent;

// Should evaluate down to a constant
var runner = new binaryen.ExpressionRunner(module, Intent.Evaluate);
var expr = runner.runAndDispose(
  module.i32.add(
    module.i32.const(1),
    module.i32.const(2)
  )
);
assert(JSON.stringify(binaryen.getExpressionInfo(expr)) === '{"id":14,"type":2,"value":3}');

// Should traverse control structures
runner = new binaryen.ExpressionRunner(module, Intent.Evaluate);
expr = runner.runAndDispose(
  module.i32.add(
    module.i32.const(1),
    module.if(
      module.i32.const(0),
      module.i32.const(0),
      module.i32.const(3)
    )
  ),
);
assert(JSON.stringify(binaryen.getExpressionInfo(expr)) === '{"id":14,"type":2,"value":4}');

// Should be unable to evaluate a local
runner = new binaryen.ExpressionRunner(module, Intent.Evaluate);
expr = runner.runAndDispose(
  module.i32.add(
    module.local.get(0, binaryen.i32),
    module.i32.const(1)
  )
);
assert(expr === 0);

// Should handle traps
runner = new binaryen.ExpressionRunner(module, Intent.Evaluate);
expr = runner.runAndDispose(
  module.unreachable()
);
assert(expr === 0);

// Should ignore some side-effects if the intent is to evaluate the expression
runner = new binaryen.ExpressionRunner(module, Intent.Evaluate);
expr = runner.runAndDispose(
  module.i32.add(
    module.local.tee(0, module.i32.const(4), binaryen.i32),
    module.i32.const(1)
  )
);
assert(JSON.stringify(binaryen.getExpressionInfo(expr)) === '{"id":14,"type":2,"value":5}');

// Should keep side-effects if the intent is to replace the expression
runner = new binaryen.ExpressionRunner(module, Intent.Replace);
expr = runner.runAndDispose(
  module.i32.add(
    module.local.tee(0, module.i32.const(4), binaryen.i32),
    module.i32.const(1)
  )
);
assert(expr === 0);

// Should work with temporary values if the intent is to evaluate the expression
runner = new binaryen.ExpressionRunner(module, Intent.Evaluate);
expr = runner.runAndDispose(
  module.i32.add(
    module.block(null, [
      module.local.set(0, module.i32.const(2)),
      module.local.get(0, binaryen.i32)
    ], binaryen.i32),
    module.block(null, [
      module.global.set("aGlobal", module.i32.const(4)),
      module.global.get("aGlobal", binaryen.i32)
    ], binaryen.i32)
  )
);
assert(JSON.stringify(binaryen.getExpressionInfo(expr)) === '{"id":14,"type":2,"value":6}');

// Should pick up explicitly preset values
runner = new binaryen.ExpressionRunner(module, Intent.Replace);
assert(runner.setLocalValue(0, module.i32.const(3)));
assert(runner.setGlobalValue("aGlobal", module.i32.const(4)));
expr = runner.runAndDispose(
  module.i32.add(
    module.local.get(0, binaryen.i32),
    module.global.get("aGlobal", binaryen.i32)
  )
);
assert(JSON.stringify(binaryen.getExpressionInfo(expr)) === '{"id":14,"type":2,"value":7}');

binaryen.setAPITracing(false);