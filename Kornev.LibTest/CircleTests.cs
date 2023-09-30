using Kornev.Lib;

namespace Kornev.LibTest;

public class CircleTests
{
    [Fact]
    public void CircleConstructorTest()
    {
        Assert.Throws<ArgumentException>(() => {
            var wrong = new Circle(0);
        });
        
        var circle = new Circle(1);
        Assert.NotNull(circle);
    }

    [Fact]
    public void CircleSquareCalcTest()
    {
        var circle = new Circle(10);
        Assert.Equivalent(Math.PI*100, circle.Square);
    }
}
