using Kornev.Lib;

namespace Kornev.LibTest;

public class TriangleTests
{
    [Fact]
    public void TriangleContructorTest()
    {
        Assert.Throws<ArgumentException>(() => {
            var wrong = new Triangle(-1, 4, 5);
        });
        
        var triangle = new Triangle(1, 4, 5);
        Assert.NotNull(triangle);
    }
    
    [Fact]
    public void TriangleIsRightTriangle()
    {
        var rightTriangle = new Triangle(3, 4, 5);
        Assert.True(rightTriangle.IsRightTriangle);

        var Simpletriangle = new Triangle(3, 4, 6);
        Assert.False(Simpletriangle.IsRightTriangle);
    }

    [Fact]
    public void TriangleSquareCalcTest()
    {
        var rightTriangle = new Triangle(3, 4, 5);
        Assert.Equivalent(6.0, rightTriangle.Square);
    }
}
