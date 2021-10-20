from __future__ import annotations

from typing import TYPE_CHECKING

from Instution.Users.User import User
from Instution.Users.UserType import UserType

from Instution.Universities.Course import Course
if TYPE_CHECKING:
    pass


class Student(User):

    def __init__(self, id: int, type: UserType=UserType.UNDERGRAD, name=None):
        super().__init__(id, type, name=name)
        self._enrollments = []

    def get_enrollments(self):
        return self._enrollments

    def add_enrollment(self, enrollment):
        self._enrollments.append(enrollment)

    def add_engagement(self, engagement) -> None:
        if (isinstance(engagement, Course)):
            self.get_enrollments().append(engagement)
        else:
            super().add_engagement(engagement)

    def generate_html(self):
        return ""

    def update(self, course: Course):
        super().update(course)
        #print(course)
    
    def insert(self) -> str:
        return super().insert()

    def __whitetest__(self, results) -> bool:
        return super().__whitetest__(results=results)