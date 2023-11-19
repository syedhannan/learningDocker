import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FirstComponentComponent } from './first-component/first-component.component';
import { NotFoundComponent } from './not-found/not-found.component';

const routes: Routes = [
  { path: 'first', component: FirstComponentComponent },
  { path: '**', component: NotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
