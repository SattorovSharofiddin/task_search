from django.db.models import Model, CharField, TextField


class Product(Model):
    name = CharField(max_length=100)
    type = CharField(max_length=100)
    size = CharField(max_length=50)
    description = TextField()

# 2.
# Mahsulotlar
# qidiruv
# tizimini
# yasang.
#
# Texnologiyalar: DRF, ElasticSearch
#
# Kodni
# yakunlab
# gitga
# yuklab
# linkni
# mani
# akkuntimga
# yuboring:
#
# @SanjarbekUsmonov13
