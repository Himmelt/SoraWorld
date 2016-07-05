#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>

int main(int argc, char *argv[])
{
//    qInstallMessageHandler(myMessageOutput);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("rootPath",QDir().currentPath());

    engine.load(QUrl(QLatin1String("qrc:/qml/rootWindow.qml")));

    return app.exec();
}
