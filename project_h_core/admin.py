from django.contrib import admin
from project_h_core.models import Services
from project_h_core.models import Payment_methods
from project_h_core.models import ServiceCategories
from project_h_core.models import ProfileMenu
from project_h_core.models import Language
from project_h_core.models import ApplicationProperties
from project_h_core.models import Currencies

# Register your models here.
admin.site.register(Services)
admin.site.register(Payment_methods)
admin.site.register(ServiceCategories)
admin.site.register(ProfileMenu)
admin.site.register(Language)
admin.site.register(ApplicationProperties)
admin.site.register(Currencies)
