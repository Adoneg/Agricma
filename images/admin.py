from django.contrib import admin
from . import models

admin.site.site_header = "Agricma Market"

@admin.register(models.Product)
class AuthorAdmin(admin.ModelAdmin):
    list_display = ('title','price', 'category', 'id', 'status', 'description', 'nutritive_benefits', 'status')
    # prepopulated_fields = {'slug': ('title',), }, title goes to slug field


admin.site.register(models.Category)
