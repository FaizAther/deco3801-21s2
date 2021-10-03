from __future__ import annotations

from typing import TYPE_CHECKING

from Instution.Users.User import User
from Instution.Users.UserType import UserType
from Instution.Universities.University import University

if TYPE_CHECKING:
    # from Instution.Universities.Course import Course
    pass

class Admin(User):

    def __init__(self, id, type=UserType.ADMIN):
        super().__init__(id, type)
        self._university = University(id, admin=self)

    def add_engagement(self, engagement) -> None:
        return super().add_engagement(engagement)
    
    def generate_html(self):
        return super().generate_html()
    
    def update(self, subject):
        return super().update(subject)
