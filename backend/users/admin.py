from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.translation import gettext_lazy as _

from .models import User, Bus, BusType

# Registration of User, Bus and BusType tables in the admin panel
@admin.register(User)
class UserAdmin(DjangoUserAdmin):

    fieldsets = (
        (None, {'fields': ('phone', 'password','user_type')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name')}),
        (_('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('phone', 'password1', 'password2'),
        }),
    )
    list_display = ('phone', 'first_name', 'last_name', 'is_staff',)
    search_fields = ('phone', 'first_name', 'last_name',)
    ordering = ('phone',)

class BusAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'number_of_people', 'number_of_seats','number_of_special_seats',)
    list_filter = ('name', 'number_of_people', 'number_of_seats','number_of_special_seats',)

admin.site.register(Bus, BusAdmin)

class BusTypeAdmin(admin.ModelAdmin):
    list_display = ('name', 'number_of_people', 'number_of_seats', 'number_of_special_seats',)
    list_filter = ('name', 'number_of_people', 'number_of_seats', 'number_of_special_seats',)

admin.site.register(BusType, BusTypeAdmin)