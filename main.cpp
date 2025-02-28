#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "fooditem.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    QList<QObject *> foodsList;
    FoodItem *banana = new FoodItem(&engine, "Banana",120);
    FoodItem *orange = new FoodItem(&engine, "Orange",200);
    FoodItem *kiwi = new FoodItem(&engine, "Kiwi",60);
    foodsList.append(banana);
    foodsList.append(orange);
    foodsList.append(kiwi);

    engine.rootContext()->setContextProperty("foodModel" , QVariant::fromValue(foodsList));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("DietWorkoutTracker", "Main");

    return app.exec();
}
