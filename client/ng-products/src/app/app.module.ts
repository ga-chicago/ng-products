import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router'

import { AppComponent } from './app.component';

import { ListModule } from './list/list.module'
import { ListComponent } from './list/list.component'

import { LoginModule } from './login/login.module'
import { LoginComponent } from './login/login.component'

const appRoutes: Routes = [
  {
    path: 'list',
    component: ListComponent
  },
  {
    path: 'login',
    component: LoginComponent
  }
]

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    ListModule,
    LoginModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})

export class AppModule { }
