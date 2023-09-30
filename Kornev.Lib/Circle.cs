using System.Numerics;

namespace Kornev.Lib;


public class Circle : ICalculatableSquare
{
    public double Square { get; }

    private double _radius;

    public Circle(double radius)
    {
        if (radius <= 0)
        {
            throw new ArgumentException("Радиус окружности должен быть больше 0.");
        }
        
        _radius = radius;
        Square = CalculateSquare();
    }

    private double CalculateSquare()
    {
        return Math.PI * _radius * _radius;
    }
}