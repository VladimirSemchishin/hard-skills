/* 
Способ создания бакета в Object Storage, позволяющий автоматизировать 
разработку - использование Terraform

Прежде Нужен сервисный аккаунт с ролью storage.editor

После нужно создать ключ для сервисного аккаунта:
Команда: 
yc iam access-key create --service-account-name service-account-for-cf

В выводе будет:

access_key:
  id: ajesdjt6i47mp56k76m5
  service_account_id: ajeb0sgt4fgu7q8c9vns
  created_at: "2023-04-12T10:20:38.774308724Z"
  key_id: YCAJEUXALlCKaIglx8oN82fI9
secret: YCMzQiBPAX6F19jpPXB_P9YBA7Z2iXfYC2OomD5E

Так же нужно получить:
- Токен:     через документацию
- Cloud-ID:  yc resource-manager cloud list
- Folder-ID: yc resource-manager folder  list

*/

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0_AgAAAABILCSCAATuwQAAAADeFOMS7UKvjVnQThOntRdGs_Ez3WIdBfQ" #<OAuth>
  cloud_id  = "b1gkieva61dbkorf2q2h" #<CLOUD_ID>
  folder_id = "b1gd4d7843kr3km8urvc" #<FOLDER_ID>
}

resource "yandex_storage_bucket" "BucketTrigger" {
  access_key = "YCAJEUXALlCKaIglx8oN82fI9" #<ACCESS_KEY>
  secret_key = "YCMzQiBPAX6F19jpPXB_P9YBA7Z2iXfYC2OomD5E" #<SECRET_KEY>
  #bucket = "BucketTrigger" #<BUCKET_NAME> название бакета нужно придумать
  #иначально имя ресурса было bucket, но выводилась ошибка о недоступности имени, 
  #по этой причине поменял на bucket-for-trigger
}

