FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Kornev.Client/Kornev.Client.csproj", "Kornev.Client/"]
RUN dotnet restore "Kornev.Client/Kornev.Client.csproj"
COPY . .
WORKDIR "/src/Kornev.Client"
RUN dotnet build "Kornev.Client.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Kornev.Client.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Kornev.Client.dll"]
