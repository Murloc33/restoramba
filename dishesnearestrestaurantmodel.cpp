#include "dishesnearestrestaurantmodel.h"

#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QStringBuilder>
#include <QByteArray>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QSslSocket>
#include <QGeoPositionInfo>

#define URL "http://91.222.238.209/menu/random-restaurant"


DishesNearestRestaurantModel::DishesNearestRestaurantModel(QObject* parent)
    :QAbstractListModel(parent)
{
    get(56.828493, 60.588545);
}

int DishesNearestRestaurantModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_dishes.size();
}

QVariant DishesNearestRestaurantModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    const DishInfo &dishInfo = m_dishes[index.row()];

    switch (role) {
    case DishNameRole:
        return QVariant::fromValue(dishInfo.dishName);
    case DishPriceRole:
        return QVariant::fromValue(dishInfo.dishPrice);
    case DishPhotoRole:
        return QVariant::fromValue(dishInfo.dishImage);
    case DishWeightRole:
        return QVariant::fromValue(dishInfo.dishWeight);
    }

    return QVariant();
}

void DishesNearestRestaurantModel::get(double latitude, double longitude)
{
    qInfo() << QSslSocket::sslLibraryBuildVersionString();
    qInfo() << QSslSocket::sslLibraryVersionString();
    QNetworkRequest request;
    QString params = QString("?latitude=%1&longitude=%2&distance_type=near").arg(latitude).arg(longitude);
    request.setUrl(QUrl(URL + params));

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    QNetworkReply* reply = manager->get(request);
    connect(reply, &QNetworkReply::finished, this, &DishesNearestRestaurantModel::slotRequestCompleted);
}

RolesHash DishesNearestRestaurantModel::roleNames() const
{
    RolesHash roles;
    roles[DishNameRole]	  = "name";
    roles[DishPriceRole]	  = "price";
    roles[DishPhotoRole]	  = "photo";
    roles[DishWeightRole]	  = "weight";

    return roles;
}

void DishesNearestRestaurantModel::slotRequestCompleted()
{
    QNetworkReply* reply = qobject_cast<QNetworkReply *>(sender());
    if (reply->error() == QNetworkReply::NoError) {
        beginResetModel();
        QJsonDocument document = QJsonDocument::fromJson(reply->readAll());
        QJsonObject root = document.object();
        QJsonArray jsonArray = root.value("content").toObject().value("menu").toObject().value("categories").toArray();
        for (auto jsonElement : jsonArray)
        {
            QJsonObject jsonObject = jsonElement.toObject();
            if (jsonObject.value("name") != "Популярные блюда")
            {
                continue;
            }

            QJsonArray jsonDishes = jsonObject.value("menu_items").toArray();

            for (auto jsonDish : jsonDishes)
            {
                QJsonObject dish = jsonDish.toObject();
                DishInfo newDish;


                newDish.dishName = "<b>" + dish.value("name").toString() + "<b>";
                if (dish.value("photo").toString() != "https://eda.yandexNone")
                {
                    newDish.dishImage = dish.value("photo").toString();
                }
                newDish.dishPrice = tr("%1 Руб.").arg(dish.value("price").toInt());
                newDish.dishWeight = tr("%1г").arg(dish.value("measure").toObject().value("value").toInt());
                qDebug() << newDish.dishName << newDish.dishImage << newDish.dishPrice << newDish.dishWeight;
                m_dishes.append(newDish);
            }
        }
        endResetModel();
    } else {
        qDebug() << "Error";
    }
    reply->deleteLater();
}
