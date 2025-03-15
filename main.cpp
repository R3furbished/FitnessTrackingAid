#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "fooditem.h"
#include "foodsmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    FoodsManager foodManager;
    // FoodItem *banana = new FoodItem(&engine, "Banana",120, 5,40,50);
    // FoodItem *orange = new FoodItem(&engine, "Orange",200);
    // FoodItem *kiwi = new FoodItem(&engine, "Kiwi",60);
    foodManager.addFoodItem("Banana",120,100,5,40,50);
    foodManager.addFoodItem("Orange",220,100,10,60,70);
    foodManager.addFoodItem("Kiwi",330,100,20,43,50);
    foodManager.addFoodItem("Rab",330,100,20,43,50);
    foodManager.addFoodItem("Tool",330,100,20,43,50);
    foodManager.addFoodItem("Frag",330,100,20,43,50);
    foodManager.addFoodItem("Hei",330,100,20,43,50);

    engine.rootContext()->setContextProperty("foodManagerModel" , &foodManager);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("DietWorkoutTracker", "Main");

    return app.exec();
}
