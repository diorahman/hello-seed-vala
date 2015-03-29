unowned Seed.Value hello(
  Seed.Context ctx, 
  Seed.Object function,
  Seed.Object this_object,
  size_t argc,
  Seed.Value[] args,
  Seed.Exception? exception
) {
  stdout.printf("Hello, from js!\n");
  return Seed.make_undefined(ctx);
}

class HelloApp : Gtk.Application {  
 
  private HelloApp() {
    Object(application_id: "id.blankon.hello");
  }

  public override void activate() {
    unowned Seed.Engine engine = Seed.init(0, null);
    unowned Seed.Object engine_global_object = (Seed.Object) engine.global;
    Seed.Context context = (Seed.Context) engine.context;
    Seed.create_function(context, "hello", (Seed.FunctionCallback) hello, engine_global_object);  
    Seed.simple_evaluate(context, "hello()", null);
    stdout.printf("Hello, from vala!\n");
  }

  public static int main (string[] args) {
    return new HelloApp().run(args);
  }
}
