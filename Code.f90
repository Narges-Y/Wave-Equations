program hyperbolic
    implicit none

    real :: l , dx , dt , cfl , c , t , pi , landa
    integer :: i , n , iteration
    doubleprecision,allocatable :: x(:),u_exact(:),u(:),u_old(:),a(:),b(:),cc(:),d(:)
    character(9) :: method,method2

    open(19,file='input.txt')
    open(18,file='exat.plt')
    open(17,file='numeric.plt')
    read(19,*)l
    read(19,*)n
    read(19,*)cfl
    read(19,*)c
    read(19,*)t

    allocate(x(n),u_exact(n),u(n),u_old(n),a(n-1),b(n-1),cc(n-1),d(n-1))


    print *,'method? linear or nonlinear?'
    read *,method
    print *,'method? lax/upwind/lax-w/b-w'
    read *,method2


 pi = 4.0*atan(1.0)

  !grid

  dx=l/(n-1)
  do i=1,n
    x(i)=(i-1)*dx
  end do

  dt=cfl*dx/c

  !exact solution of linear method

  if(method=='linear')then
    do i=1,n
        if(1.0+c*t<x(i) .and. x(i)<2.0+c*t)then
            u_exact(i)= sin(pi*(x(i)-c*t-1.0))
            else
                u_exact(i)=1.0
        end if
    end do
  end if

 !numerical solution

 do i=1,n
    if(1.0<x(i) .and. x(i)<2.0)then
        u(i)= sin(pi*(x(i)-1.0))
        else
            u(i)=1.0
    end if
 end do

 !boundary

 if(method2 /='b-w')then
    u(1)=1.0
 end if

 !solving linear

 if(method == 'linear')then
    iteration=0
    do
        iteration = iteration + 1
        u_old(:) = u(:)

        if(method2 == 'lax')then
            landa=1.0
         elseif(method2 == 'upwind')then
            landa=cfl
          elseif(method2 == 'lax-w')then
            landa= cfl**2.0
        end if

        do i=2,n-1
            u(i)=u_old(i)-(cfl/2.0)*(u_old(i+1)-u_old(i-1))+(landa/2.0)*(u_old(i-1)-2.0*u_old(i)+u_old(i+1))
            end do
        u(n)= 2.0*u(n-1)-u(n-2)
        if(method2 == 'b-w')then

            a(1)=0.0
            b(1)=1.0
            cc(1)=0.0
            d(1)=1.0
            a(n-1)= -cfl/4.0
            b(n-1)= 1.0
            cc(n-1)=0.0
            d(n-1)= u_old(n-1)-(cfl/4.0)*(u_old(n)-u_old(n-2))
            do i=2,n-2
            a(i)= -cfl/4.0
            b(i)=1.0
            cc(i)=cfl/4.0
            d(i)= u_old(i)-(cfl/4.0)*(u_old(i+1)-u_old(i-1))
            end do

            call thomas(n-1,a,b,cc,d,u)
        u(n)=2.0*u(n-1)-u(n-2)
        end if
  if(abs(dt*iteration-t)<dt)exit
    end do

    !nonlinear

    elseif(method == 'nonlinear')then
      iteration=0
      do
        iteration = iteration + 1
        u_old(:) = u(:)

    if(method2 == 'lax')then
        do i=2,n-1
         u(i)=((u_old(i+1)+u_old(i-1))/2.0)-(dt/(4.0*dx))*((u_old(i+1)**2.0)-(u_old(i-1)**2.0))
        end do

        elseif(method2 == 'upwind')then
            do i=2,n-1
        u(i)=u_old(i)-(dt/(2.0*dx))*((u_old(i)**2.0)-(u_old(i-1)**2.0))
            end do

        elseif(method2 == 'lax-w')then
            do i=2,n-1
u(i)=u_old(i)-(dt/(4.0*dx))*(u_old(i+1)**2.0-u_old(i-1)**2.0)+(dt**2.0/(8.0*(dx**2.0)))*((u_old(i)+u_old(i+1))*&
(u_old(i+1)**2.0-u_old(i)**2.0)-(u_old(i)+u_old(i-1))*(u_old(i)**2.0-u_old(i-1)**2.0))
            end do
    end if

    u(n)=2.0*u(n-1)-u(n-2)
    if(method2 == 'b-w')then

        a(1)=0.0
        b(1)=1.0
        cc(1)=0.0
        d(1)=1.0
        do i=2,n-2
            a(i)= -dt*u_old(i-1)/(4.0*dx)
            b(i)=1.0
            cc(i)= dt*u_old(i+1)/(4.0*dx)
            d(i)= u_old(i)
        end do
        a(n-1)= -dt*u_old(n-2)/(4.0*dx)
        b(n-1)=1.0
        cc(n-1)= 0.0
        d(n-1)= u_old(n-1)

        call thomas(n-1,a,b,cc,d,u)
        u(n)=2.0*u(n-1)-u(n-2)
        end if
  if(abs(dt*iteration-t)<dt)exit
    end do
    end if

    !results

    write(18,*) 'variables=x,u'
    write(17,*) 'variables=x,u'

    do i=1,n
        write(18,*) x(i),u_exact(i)
    end do

    do i=1,n
        write(17,*) x(i),u(i)
    end do
    end program

    subroutine thomas(n,a,b,c,rhs,u)
        implicit none
        doubleprecision :: a(n),b(n),c(n),rhs(n),u(n)
        integer :: i,n

        do i=2,n
            b(i)= b(i)-a(i)*c(i-1)/b(i-1)
            rhs(i)=rhs(i)-a(i)*rhs(i-1)/b(i-1)
            a(i)=0.0
        end do

        u(n)= rhs(n)/b(n)
        do i=n,2,-1
            u(i-1)= (rhs(i-1)-c(i-1)*u(i))/b(i-1)
        end do
        end subroutine


