using System.Text;

namespace Kornev.Lib;

public class Triangle : ITriangle, ICalculatableSquare
{
    public double Square { get; }

    public bool IsRightTriangle { get;}
    
    private readonly double[] _sides;
    
    public Triangle(double sideA, double sideB, double sideC)
    {
        _sides = (new[]
        {
            sideA,
            sideB,
            sideC
        }).OrderDescending().ToArray();
        if (_sides.Any(side => side <= 0))
        {
            throw new ArgumentException("Стороны треугольника должнна быть больше 0.");
        }

        Square = CalculateSquare();
        IsRightTriangle = CalculateIsRightTriangle();
    }

    private double CalculateSquare()
    {
        var halPerimeter = (_sides[0] + _sides[1] + _sides[2]) / 2;
        return Math.Sqrt((halPerimeter * (halPerimeter - _sides[0]) * (halPerimeter - _sides[1]) * (halPerimeter - _sides[2])));
    }
    
    private bool CalculateIsRightTriangle()
    {
        var squareHypotenuse = Math.Pow(_sides[0], 2);
        var sumOfSquareOtherSides = Math.Pow(_sides[1], 2) + Math.Pow(_sides[2], 2);

        if (squareHypotenuse == sumOfSquareOtherSides)
            return true;

        // Необходимо учесть возможную потерю точности у вещественных чисел в двоичной форме 
        if (Math.Abs(squareHypotenuse - sumOfSquareOtherSides) < 0.000001)
            return true;

        return false;
    }
}
