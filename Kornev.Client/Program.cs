using System.Numerics;
using Kornev.Lib;

var figures = new List<ICalculatableSquare>()
{
    new Circle(10),
    new Rectangle(10, 20),
    new Triangle(3, 4, 5),
    new Triangle(3, 4, 6),
};

// Я не до конца понял задания "Вычисление площади фигуры без знания типа фигуры в compile-time" и
// предположил что тут подразумевается использование полифорнизма, т.к. маловероятно на middle-разработчика
// стали бы делать задание на Reflection и Expression Trees
void SomeClientFunc(IEnumerable<ICalculatableSquare> figures)
{
    foreach (var figure in figures)
    {
        Console.Write($"Площадь фигуры {figure.Square}");
        if (figure is ITriangle triangle)
        {
            Console.Write($" это кстати треугольник");
            if (triangle.IsRightTriangle)
            {
                Console.Write($" и он прямой! Прямоугольный треугольник!" );    
            }
        }
        Console.Write(Environment.NewLine);
    }
}

SomeClientFunc(figures);

Console.ReadLine();


// Пример лёгко добавления новых фигур в клиентском коде
class Rectangle : ICalculatableSquare
{
    public double Square { get; }

    public Rectangle(double width, double height)
    {
        if (width <= 0 || height <= 0)
        {
            throw new ArgumentException("Стороны прямоульника должны быть больше 0.");
        }

        Square = CalculateSquare(width, height);
    }

    private double CalculateSquare(double width, double height)
    {
        return width * height;
    }
}